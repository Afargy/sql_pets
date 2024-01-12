SELECT    p.name,
          m.pizza_name,
          m.price,
          ROUND(m.price - m.price * pd.discount / 100) AS discount_price,
          pz.name
FROM      person_order AS po
JOIN      person AS p ON p.id = po.person_id
JOIN      menu AS m ON m.id = po.menu_id
JOIN      pizzeria AS pz ON pz.id = m.pizzeria_id
JOIN      person_discounts AS pd ON pd.person_id = po.person_id AND      
          pd.pizzeria_id = pz.id
ORDER BY  p.name,
          pz.name;
