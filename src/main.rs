use actix_web::{
    get,
    http::StatusCode,
    web::{self, Data, Json, Query, ServiceConfig},
    HttpResponse, Responder, ResponseError,
};
use serde::{Deserialize, Serialize};
use shuttle_actix_web::ShuttleActixWeb;
use shuttle_secrets::SecretStore;
use sqlx::{types::Decimal, PgPool};

struct AppState {
    pub db: PgPool,
}

#[derive(Debug)]
struct ApiError(anyhow::Error);

type Result<T> = std::result::Result<T, ApiError>;

#[shuttle_runtime::main]
async fn actix_web(
    #[shuttle_shared_db::Postgres] pool: PgPool,
    #[shuttle_secrets::Secrets] _secret_store: SecretStore,
) -> ShuttleActixWeb<impl FnOnce(&mut ServiceConfig) + Send + Clone + 'static> {
    sqlx::migrate!().run(&pool).await.unwrap();

    let data = Data::new(AppState { db: pool });

    let config = move |cfg: &mut ServiceConfig| {
        cfg.service(hello_world)
            .service(get_food_list)
            .service(get_food_item)
            .app_data(data);
    };

    Ok(config.into())
}

#[get("/")]
async fn hello_world() -> impl Responder {
    "hello"
}

#[derive(sqlx::FromRow, Serialize)]
struct FoodItem {
    id: i32,
    name: String,
    description: String,
    price_paisa: Decimal,
}

#[derive(sqlx::FromRow, Deserialize)]
struct FoodItemCreate {
    name: String,
    description: String,
    price_paisa: Decimal,
}

#[derive(Deserialize)]
struct PageQuery {
    page: Option<u32>,
    limit: Option<u32>,
}

#[get("/menu")]
async fn get_food_list(query: Query<PageQuery>, state: Data<AppState>) -> Json<Vec<FoodItem>> {
    let page = query.page.unwrap_or(1);
    let limit = query.limit.unwrap_or(15);

    let list = sqlx::query_as(
        r#"
    SELECT * FROM food_items
    LIMIT $1
    OFFSET $2
    "#,
    )
    .bind(limit as i32)
    .bind((limit * page) as i32)
    .fetch_all(&state.db)
    .await
    .unwrap();

    Json(list)
}

#[get("/menu/{id}")]
async fn get_food_item(path: web::Path<u32>, state: Data<AppState>) -> Json<Option<FoodItem>> {
    let id = path.into_inner();

    let list = sqlx::query_as(
        r#"
    SELECT * FROM food_items
    WHERE id = $1
    "#,
    )
    .bind(id as i32)
    .fetch_optional(&state.db)
    .await
    .unwrap();

    Json(list)
}

impl From<ApiError> for anyhow::Error {
    fn from(value: ApiError) -> Self {
        value.0
    }
}

impl From<anyhow::Error> for ApiError {
    fn from(value: anyhow::Error) -> Self {
        ApiError(value)
    }
}

impl std::fmt::Display for ApiError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{:#?}", *self)
    }
}

impl ResponseError for ApiError {
    fn status_code(&self) -> actix_web::http::StatusCode {
        StatusCode::INTERNAL_SERVER_ERROR
    }

    fn error_response(&self) -> actix_web::HttpResponse<actix_web::body::BoxBody> {
        HttpResponse::Ok()
            .content_type("application/json")
            .body(self.0.to_string())
    }
}
