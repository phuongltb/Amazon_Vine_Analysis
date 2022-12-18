# Amazon_Vine_Analysis
Perform ETL on Amazon Product Reviews using PySpark and SQL to determine bias of wine reviews

## Overview of the project
This project consists of the following analysis:
  - Perform ETL on Amazon Product Reviews
  - Determine Bias of Vine Reviews

## Results
  1. Perform ETL on Amazon Product Reviews  
      - Extract the review dataset, count all the customer id, rename count(customerid) column, and load data to table Customers_Table.  
      -   
          ![image](https://user-images.githubusercontent.com/110554264/208306176-2f740b3c-5863-46ee-9d47-8571c688601e.png)
      
      - Select the product_id and product_title, then drop duplicates to retrieve only unique product_ids, and load data to table Products_Table.    
      
          ![image](https://user-images.githubusercontent.com/110554264/208306480-2f56e78c-e508-4891-8879-86df6bf35234.png)
          
      - Select the columns that are in the review_id_table in pgAdmin, convert the review_date column to a date, and load to Review_id_Table. 
        
          ![image](https://user-images.githubusercontent.com/110554264/208306600-d312114f-cdb2-4635-8197-e3334b403e43.png) 
          
      - Select only the columns that are in the vine_table in pgAdmin, and load to Vine_Table.
      
          ![image](https://user-images.githubusercontent.com/110554264/208306637-6fe37b9b-90c3-436e-b179-15dc57959384.png)           
    
  2. Determine Bias of Vine Reviews
      - Create a vine_table on a local database and import data into the table using data from the vine_table on AWS
      - Filter data and create a table to retrieve all the rows where the total_votes count is equal to or greater than 20
      
        ![image](https://user-images.githubusercontent.com/110554264/208307787-7afaae93-595c-463c-b8b2-77a76829b545.png)
      - Filter data and create a table to retrieve all the rows where the number of helpful_votes divided by total_votes is equal to or greater than 50%.
      
        ![image](https://user-images.githubusercontent.com/110554264/208307891-f78c5eae-5381-4635-b545-df6efea0b47f.png)
      - Filter data and create a table to retrieve all the rows where a review was written as part of the Vine program (paid)
      
        ![image](https://user-images.githubusercontent.com/110554264/208307953-85f73484-24b3-4bd0-a9e2-432c08b7c406.png)
      - Filter data and create a table to retrieve all the rows where the review was not part of the Vine program (unpaid)
      
        ![image](https://user-images.githubusercontent.com/110554264/208308002-4b95e4e4-b76f-4f1f-b99b-fbdd2361c8d1.png)
      - There are 613 paid reviews and 64968 unpaid reviews
      
        ![image](https://user-images.githubusercontent.com/110554264/208308064-e113caa7-3974-49f0-99fe-fc5a9dc7e198.png)
        ![image](https://user-images.githubusercontent.com/110554264/208308097-1cdf389d-1d6f-48e1-a8fd-dedb59796661.png)
      - There are 222 paid reviews and 30543 unpaid reviews were 5 stars. 
      - There are 36.2% Vine reviews were 5 stars and 47% non-Vine reviews were 5 stars 
            
        ![image](https://user-images.githubusercontent.com/110554264/208308473-b4880019-8d76-4ccb-9edd-d5e6cc845e20.png)
        
        ![image](https://user-images.githubusercontent.com/110554264/208308249-5364d70f-081d-4e56-a089-3d6b327b0f70.png)     

## Summary
  Based on the figures of vine reviews and non-vine reviews analyzed above, we can conclude that there is no bias for reviews in the Vine program. The 5-star reviews were mostly from unpaid reviews which is 12 times greater than from paid reviews. Out of unpaid reviews, there are 47% reviews were 5 stars while there are only 36.2% of paid reviews were 5 stars.
  
  Additionally, if we look into the number of purchases that have been verified for these reviews, it will give more evidence of the possibility of bias. 
  
   ![image](https://user-images.githubusercontent.com/110554264/208309312-9bf80c72-147a-4835-9f95-e50864b5b36d.png)
    
 This analysis on the number of verified purchases shows that all of these reviews were from customers who actually purchased the products. And this is once again support the statement that there is no bias for reviews in the Vine program.

