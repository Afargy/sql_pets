UPDATE    menu AS m
SET       price = m.price * 0.90
WHERE     m.pizza_name = 'greek pizza';
