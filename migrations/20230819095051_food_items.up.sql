CREATE TABLE
  food_items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR NOT NULL,
    price_rupees INTEGER NOT NULL,
    image VARCHAR NOT NULL,
    is_vegetarian BOOLEAN NOT NULL
  );

INSERT INTO
  food_items (
    name,
    description,
    price_rupees,
    image,
    is_vegetarian
  )
VALUES
  (
    'Punjabi Spicy Chaap Tikka',
    'Serves 3 | Sliced shaped soyabean chops marinated with yoghurt, hot spices and roasted in tandoor with onion and capsicum',
    249,
    'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/niau2vf8qajld1lx1v3t',
    TRUE
  ),
  (
    'Paneer Butter Masala',
    'Cottage cheese cooked in a rich tomato gravy and tempered with butter',
    269,
    'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/felwxxzmpir1znsmwbso',
    TRUE
  ),
  (
    'Paneer Do Pyaaza',
    'Cottage cheese coooked with indian spices and caramalised onions',
    265,
    'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/wpmzhrk7bmclr4t2aung',
    TRUE
  ),
  (
    'Boneless Butter Chicken',
    'A rich and creamy North Indian curry made using boneless chicken cubes, khoya, lots of butter, and spices.',
    449,
    'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/kazwr88fcmbtbogliogw',
    FALSE
  ),
  (
    'Butter Chicken',
    'Grilled Tandoori chicken is simmered in a spicy, aromatic, buttery and creamy tomato gravy.',
    449,
    'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/84fb838c63306c03de9fad66906db5b8',
    FALSE
  ),
  (
    'Veg Hyderabadi Dum Biryani',
    'Serves 1 | Fresh vegetables are marinated in a mixture of freshly ground BBK spices & layered with long grain basmati rice in the handi and slow cooked in the handi. Each biryani order is individually cooked in hand made clay handi and served to you in the same earthenware. BBK biryani is layered, and Masala is at bottom of Handi. To enjoy authentic flavours mix it well. [1/2kg serves 1-2]',
    399,
    'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/9cc78355df1cc7e014b11cfc43696c5e',
    TRUE
  ),
  (
    'Chicken Hyderabadi Dum Biryani',
    'Serves 1 | 1/2 kg contains 4 pcs fresh chicken are marinated in a mixture of freshly ground BBK spices & layered with long grain basmati rice in the handi and slow-cooked in the handi. Each biryani order is individually cooked in hand made clay handi and served to you in the same earthenware. BBK biryani is layered, and Masala is at bottom of Handi. To enjoy authentic flavours mix it well. [1/2kg serves 1-2]',
    499,
    'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/zxl5y7f2pl2ghcu4uh6i',
    FALSE
  ),
  (
    'Mutton Hyderabadi Dum Biryani',
    'Serves 1 | 1/2 kg contains 4 pcs fresh mutton is marinated in a mixture of freshly ground BBK spices & layered with long grain basmati rice in the handi and slow cooked in the handi. Each biryani order is individually cooked in hand made clay handi and served to you in the same earthenware. BBK biryani is layered, and Masala is at bottom of Handi. To enjoy authentic flavours mix it well.',
    715,
    'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/janllg2jvjmllv8fswd8',
    FALSE
  ),
  (
    'Gulab Jamun with Rabri',
    '2pcs Gulab Jamun served with Kesar Rabri',
    175,
    'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/pbocjplbelzvijyzx1aw',
    TRUE
  ),
  (
    'Mango Ice Cream',
    'Serves 1 | [125 ml] Made from fresh and pulpy mangoes, you can taste summer with each spoon you take. The rich and creamy texture will surely be a delight to your taste buds! per 100g: protein 10.2g, carbs 11g, calories 124.4kcal',
    115,
    'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/ryvasmmlenhhjvx7er2h',
    TRUE
  ),
  (
    'Chicken Shawarma Roll',
    'Serves 1 | Boneless Doner Chicken, diced and wrapped in a Bread of your choice loaded with Pickled Veggies & in-house spread.',
    190,
    'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_208,h_208,c_fit/b09db8cc2f2e550833ae1df237f9aff4',
    FALSE
  );
