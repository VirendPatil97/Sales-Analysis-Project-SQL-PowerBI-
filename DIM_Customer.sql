--Cleansed and transformed the customer table
SELECT 
  c.[CustomerKey] as CustomerKey 
  --   ,[GeographyKey]
  --   ,[CustomerAlternateKey]
  --   ,[Title]
  , 
  c.[FirstName] as FirstName 
  --   ,[MiddleName]
  , 
  c.[LastName] as LastName, 
  c.[FirstName] + ' ' + c.[LastName] as FullName 
  --   ,[NameStyle]
  --   ,[BirthDate]
  --   ,[MaritalStatus]
  --   ,[Suffix]
  , 
  case WHEN c.[Gender] = 'M' THEN 'Male' WHEN c.[Gender] = 'F' THEN 'Female' END as Gender 
  --   ,[EmailAddress]
  --   ,[YearlyIncome]
  --   ,[TotalChildren]
  --   ,[NumberChildrenAtHome]
  --   ,[EnglishEducation]
  --   ,[SpanishEducation]
  --   ,[FrenchEducation]
  --   ,[EnglishOccupation]
  --   ,[SpanishOccupation]
  --   ,[FrenchOccupation]
  --   ,[HouseOwnerFlag]
  --   ,[NumberCarsOwned]
  --   ,[AddressLine1]
  --   ,[AddressLine2]
  --   ,[Phone]
  , 
  c.[DateFirstPurchase] as FirstPurchaseDate, 
  g.[City] as CustomerCity -- Joined in customer city from the geography table
  --   ,[CommuteDistance]
FROM 
  [dbo].[DimCustomer] c 
  left join [dbo].[DimGeography] g on c.GeographyKey = g.GeographyKey 
order by 
  c.CustomerKey ASC
