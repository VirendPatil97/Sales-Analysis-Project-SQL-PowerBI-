--Cleansed and transformed the products table
SELECT 
  p.[ProductKey] as ProductKey, 
  p.[ProductAlternateKey] as ProductItemCode
  --   ,[ProductSubcategoryKey]
  --   ,[WeightUnitMeasureCode]
  --   ,[SizeUnitMeasureCode]
  , 
  p.[EnglishProductName] as ProductName, 
  ps.[EnglishProductSubcategoryName] as ProductSubcategory  -- joined in from Sub Category Table
  , 
  pc.[EnglishProductCategoryName] as ProductCategory        -- joined in from Category Table
  --   ,[SpanishProductName]
  --   ,[FrenchProductName]
  --   ,[StandardCost]
  --   ,[FinishedGoodsFlag]
  , 
  p.[Color] as ProductColor 
  --   ,[SafetyStockLevel]
  --   ,[ReorderPoint]
  --   ,[ListPrice]
  , 
  p.[Size] as ProductSize 
  --   ,[SizeRange]
  --   ,[Weight]
  --   ,[DaysToManufacture]
  , 
  p.[ProductLine] as ProductLine 
  --   ,[DealerPrice]
  --   ,[Class]
  --   ,[Style]
  , 
  p.[ModelName] as ProductModelName 
  --   ,[LargePhoto]
  , 
  p.[EnglishDescription] as ProductDescription 
  --   ,[FrenchDescription]
  --   ,[ChineseDescription]
  --   ,[ArabicDescription]
  --   ,[HebrewDescription]
  --   ,[ThaiDescription]
  --   ,[GermanDescription]
  --   ,[JapaneseDescription]
  --   ,[TurkishDescription]
  --   ,[StartDate]
  --   ,[EndDate]
  , 
  Isnull(p.[Status], 'Outdated') as ProductStatus 
FROM 
  [AdventureWorksDW2022].[dbo].[DimProduct] p 
  left join [dbo].[DimProductSubcategory] ps on p.ProductSubcategoryKey = ps.ProductSubcategoryKey 
  left join [dbo].[DimProductCategory] pc on ps.ProductCategoryKey = pc.ProductCategoryKey 
order by 
  p.ProductKey asc
