#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


ClipSaved := ClipboardAll
Clipboard = 
(
with results as (
select  count(distinct product_id) as products,
        sum(null_display) as null_display,
        sum(promo_index) as promo_index,
        sum(prices) as prices,
        sum(in_stock) as in_stock,
        sum(images) as images,
        sum(cat) as cat,
        sum(case when null_display = 1 and promo_index = 1 and prices = 1 and in_stock = 1 and images = 1 and cat = 1 then 1 else 0 end) as promotable
from    ( select  pr.product_id,
                  case when pr.display_name is not null then 1 else 0 end as null_display,
                  case when pr.promotion_index is null or pr.promotion_index <> -1 then 1 else 0 end as promo_index,
                  case when (pr.prior_price is null) or (pr.prior_price >= pr.price) then 1 else 0 end as prices,
                  ( select  count(distinct sk.product_id) as in_stock
                    from    rm_sku sk
                    where   sk.client_id = pr.client_id
                            and sk.product_id = pr.product_id
                            and sk.in_stock = 1 ) as in_stock,
                  ( select  count(distinct im.product_id) as images
                    from    rm_client_images im
                    where   im.client_id = pr.client_id
                            and im.product_id = pr.product_id
                            and im.url_invalid_time is null
                            and im.type = 0 ) as images,
                  ( select  count(distinct rel.product_id) as cat
                    from    rm_product_cat_rels rel
                            inner join rm_categories cat  on  cat.id = rel.category_id
                                                          and ( cat.type is null or cat.type = 0 )
                    where   rel.product_id = pr.product_id ) as cat
          from    rm_client cl
                  left outer join rm_product pr on  pr.client_id = cl.client_id
          where   cl.identifier = '&clientidentifier' ) results )

select  'Total Products:' as description,
        products as rowcount
from    results
union all
select  'Non-Null Display Name:' as description,
        null_display as rowcount
from    results
union all
select  'Promotion Index <> -1 or is null:' as description,
        promo_index as rowcount
from    results
union all
select  'Prior Price >= Current Price:' as description,
        prices as rowcount
from    results
union all
select  'Products In Stock:' as description,
        in_stock as rowcount
from    results
union all
select  'Valid Images:' as description,
        images as rowcount
from    results
union all
select  'Valid Category:' as description,
        cat as rowcount
from    results
union all
select  'Promotable Products:' as description,
        promotable as rowcount
from    results;
)
Send ^v
sleep 100
Clipboard := ClipSaved
ClipSaved =
return