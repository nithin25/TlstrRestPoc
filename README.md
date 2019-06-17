# TlstrRestPoc

Sample app to read and display json content using MVVM design pattern.

Using basics of Codable protocol for Json serialization and deserialization.

Network manager class designed to fetch json and decode the content to match any model using Generic type. Which need to pass url request method etc to Network Manager using "Resource" Struct which accept model type too which inturn used to decode into any model.
