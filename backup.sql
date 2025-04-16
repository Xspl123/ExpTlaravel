-- MySQL dump 10.13  Distrib 5.7.44, for Linux (x86_64)
--
-- Host: localhost    Database: laravel_db
-- ------------------------------------------------------
-- Server version	5.7.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_balance` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_user_id_foreign` (`user_id`),
  CONSTRAINT `accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (6,5,'Cash',5500,'2025-04-07 09:34:10','2025-04-07 10:44:12'),(7,9,'Cash',49000,'2025-04-07 10:58:33','2025-04-07 12:39:41'),(8,6,'Kotak Bank',23596,'2025-04-07 12:18:56','2025-04-15 11:32:58');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgets`
--

DROP TABLE IF EXISTS `budgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `budgets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `budget_amount` decimal(18,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `budgets_user_id_foreign` (`user_id`),
  KEY `budgets_category_id_foreign` (`category_id`),
  CONSTRAINT `budgets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `budgets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgets`
--

LOCK TABLES `budgets` WRITE;
/*!40000 ALTER TABLE `budgets` DISABLE KEYS */;
INSERT INTO `budgets` VALUES (18,5,15,33200.00,0.00,'2025-04-07 09:34:47','2025-04-07 09:34:47'),(19,5,16,15000.00,0.00,'2025-04-07 10:00:38','2025-04-07 10:00:38'),(20,5,17,11700.00,0.00,'2025-04-07 10:37:49','2025-04-07 10:37:49'),(21,5,18,350.00,0.00,'2025-04-07 10:42:59','2025-04-07 10:42:59'),(22,5,19,650.00,0.00,'2025-04-07 10:44:12','2025-04-07 10:44:12'),(23,9,20,10000.00,0.00,'2025-04-07 10:59:14','2025-04-07 10:59:14'),(24,9,23,1000.00,0.00,'2025-04-07 11:01:44','2025-04-07 11:01:44'),(25,9,22,5000.00,0.00,'2025-04-07 11:02:08','2025-04-07 11:02:08'),(26,9,25,2000.00,0.00,'2025-04-07 11:02:35','2025-04-07 11:02:35'),(27,9,21,1000.00,0.00,'2025-04-07 11:03:04','2025-04-07 11:03:04'),(28,9,24,2000.00,0.00,'2025-04-07 11:03:33','2025-04-07 12:39:41'),(29,6,27,63200.00,0.00,'2025-04-07 12:19:41','2025-04-14 06:03:20'),(30,6,28,15000.00,0.00,'2025-04-07 12:22:04','2025-04-07 12:22:04'),(31,6,29,350.00,0.00,'2025-04-07 12:24:37','2025-04-07 12:24:38'),(32,6,30,650.00,0.00,'2025-04-07 12:26:38','2025-04-07 12:26:38'),(33,6,31,10000.00,0.00,'2025-04-07 12:43:22','2025-04-07 12:43:22'),(34,6,32,1757.00,0.00,'2025-04-07 12:45:32','2025-04-07 12:45:32'),(35,6,33,947.00,0.00,'2025-04-07 12:46:20','2025-04-07 12:46:21'),(36,6,26,60.00,0.00,'2025-04-08 10:23:24','2025-04-08 10:23:24'),(37,6,34,40.00,0.00,'2025-04-08 10:25:01','2025-04-14 05:04:37'),(38,6,35,400.00,0.00,'2025-04-08 10:27:29','2025-04-08 10:27:29'),(39,6,36,10400.00,0.00,'2025-04-15 11:32:57','2025-04-15 11:32:58');
/*!40000 ALTER TABLE `budgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `type` enum('Income','Expense') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Expense',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `budget` decimal(10,2) DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_user_id_foreign` (`user_id`),
  CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (15,'Salary',NULL,'Income',0,0.00,NULL,5,'2025-04-07 09:33:52','2025-04-07 09:33:52',NULL),(16,'Helth',NULL,'Expense',0,0.00,NULL,5,'2025-04-07 10:00:15','2025-04-07 10:00:15',NULL),(17,'Home Expence',NULL,'Expense',0,0.00,NULL,5,'2025-04-07 10:37:05','2025-04-07 10:37:05',NULL),(18,'Medicin',NULL,'Expense',0,0.00,NULL,5,'2025-04-07 10:42:27','2025-04-07 10:42:27',NULL),(19,'Transport',NULL,'Expense',0,0.00,NULL,5,'2025-04-07 10:43:28','2025-04-07 10:43:28',NULL),(20,'Salary',NULL,'Income',0,0.00,NULL,9,'2025-04-07 10:57:42','2025-04-07 10:57:42',NULL),(21,'Vegitable',NULL,'Expense',0,0.00,NULL,9,'2025-04-07 10:59:42','2025-04-07 10:59:42',NULL),(22,'Rent',NULL,'Expense',0,0.00,NULL,9,'2025-04-07 10:59:54','2025-04-07 10:59:54',NULL),(23,'Recharge',NULL,'Expense',0,0.00,NULL,9,'2025-04-07 11:00:18','2025-04-07 11:00:18',NULL),(24,'Shopping',NULL,'Expense',0,0.00,NULL,9,'2025-04-07 11:00:31','2025-04-07 11:00:31',NULL),(25,'Grocery',NULL,'Expense',0,0.00,NULL,9,'2025-04-07 11:00:52','2025-04-07 11:00:52',NULL),(26,'Milk',NULL,'Expense',0,0.00,NULL,6,'2025-04-07 12:18:22','2025-04-07 12:18:22',NULL),(27,'Salary',NULL,'Income',0,0.00,NULL,6,'2025-04-07 12:18:34','2025-04-07 12:18:34',NULL),(28,'Helth',NULL,'Expense',0,0.00,NULL,6,'2025-04-07 12:21:37','2025-04-07 12:21:37',NULL),(29,'Madicin',NULL,'Expense',0,0.00,NULL,6,'2025-04-07 12:24:08','2025-04-07 12:24:08',NULL),(30,'Transport',NULL,'Expense',0,0.00,NULL,6,'2025-04-07 12:25:49','2025-04-07 12:25:49',NULL),(31,'Home',NULL,'Expense',0,0.00,NULL,6,'2025-04-07 12:42:24','2025-04-07 12:42:24',NULL),(32,'insurance',NULL,'Expense',0,0.00,NULL,6,'2025-04-07 12:44:46','2025-04-07 12:44:46',NULL),(33,'Fule',NULL,'Expense',0,0.00,NULL,6,'2025-04-07 12:45:46','2025-04-07 12:45:46',NULL),(34,'Food',NULL,'Expense',0,0.00,NULL,6,'2025-04-08 10:24:31','2025-04-08 10:24:31',NULL),(35,'Vagitable',NULL,'Expense',0,0.00,NULL,6,'2025-04-08 10:27:00','2025-04-09 07:35:38',NULL),(36,'Rent',NULL,'Expense',0,0.00,NULL,6,'2025-04-15 11:31:44','2025-04-15 11:31:44',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_03_12_065510_create_personal_access_tokens_table',1),(5,'2025_03_12_091337_create_categories_table',1),(6,'2025_03_12_105906_create_transactions_table',1),(7,'2025_03_12_111230_create_budgets_table',1),(8,'2025_03_13_083055_create_accounts_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (11,'App\\Models\\User',2,'auth_token','e2facabfb4d510a8165313e009ad01632d5ab6f8417e7b40cebdea39a8b6e212','[\"*\"]','2025-04-08 08:19:48',NULL,'2025-04-08 08:19:29','2025-04-08 08:19:48'),(12,'App\\Models\\User',6,'auth_token','35f738e1f58c88232526bbbe0850684301f58a59b345afa035037462e5c12e1e','[\"*\"]','2025-04-12 11:33:25',NULL,'2025-04-12 11:27:08','2025-04-12 11:33:25'),(13,'App\\Models\\User',6,'auth_token','dbfb03f1c0041e9515a714aab51ada1a1fbc836fe9956f1ede2650ab0107515a','[\"*\"]','2025-04-15 12:45:05',NULL,'2025-04-14 05:03:54','2025-04-15 12:45:05'),(14,'App\\Models\\User',6,'auth_token','43e828292b530652202bcf868556ac987bbd2f2dc389394f7285b1086442e0fd','[\"*\"]','2025-04-15 11:28:11',NULL,'2025-04-15 10:14:10','2025-04-15 11:28:11');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('bIyIrE4o6ZT45IHFbP9pq1zrLF4z9wW6M9GKmw5w',NULL,'192.168.1.170','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVUxTVByZDU1MmExMVJuUjBnQ0ZxcEVEdU5scUFjdzNvb1IySTR5byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xOTIuMTY4LjEuMTcwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1742816325),('CsfVUVpIKkvf8zU1AM7t2oeRDgWZESe94K4FKH1J',NULL,'172.18.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZndtMWxNU1VhVk1HbmRXNTFCdUVCTElqSk1kc0ZRVnFVRllYY3VtSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTY6Imh0dHA6Ly9sb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1743575267),('fRFchmUnYw96h0nCBDS9EVjIMjMkMnfMx3DAah4r',NULL,'192.168.1.170','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiR3lKWkFFcmZnd0RLZFlTYUZKdnBaelpVUUg0REZRRTBrT1RkY0piWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1743764896),('GtCfvnK0s8zqgG5JAgZy4g4GF9Kkk9860h8y4sJ5',NULL,'192.168.1.170','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzZlc2tWVGphd2pBT3J4Q3JQRWw0cERZSDZFUkVPZlEwcTJZRlhIUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly9sYXJhdmVsLmxvY2FsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1742816349),('iTVpswwd3kCeIrQ261hjBIkfXZxbctRh3LYjnNNW',NULL,'192.168.1.170','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoiaEpON09VTW9EYzdqT0JNZlM0SVNPQ1hWVXdLeVc3UzJud1BRMzJzYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1744006366),('LiLUVpD0RBsBd0TZkPfBK0JjomOioTJRg87WbOCS',NULL,'192.168.1.170','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidWxqUjVzQ2dQZWxxM3g4RmFZTEFnSkJLRTNMWHFzZkcyRDZHMjBkciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xOTIuMTY4LjEuMTcwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1743684355),('NDF24kePKuPIFbWSHcRcZ2i7Cku31RMHvlelk1tT',NULL,'192.168.1.170','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 Safari/537.36','YToyOntzOjY6Il90b2tlbiI7czo0MDoidmpjUlZSbE51R0hIR0pGZzM4MEY4cDN6aEZDUHVFcGw5ZEdiRktwQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1744262388),('oqEZWOjxUfo9dcPuePwnE0UHbJAn7e2omkCO2Fxn',NULL,'192.168.1.198','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibDdrVFlJUkFHTEVTN08zd3ZSUXN0VUs0aGJIUzZnZ01CaU9mVUc1UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly8xOTIuMTY4LjEuMTcwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1744361706);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `account_id` bigint(20) unsigned NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('income','expense') COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `file` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_user_id_foreign` (`user_id`),
  KEY `transactions_category_id_foreign` (`category_id`),
  CONSTRAINT `transactions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (32,5,15,6,33200.00,'income','salary','2025-04-01',NULL,'2025-04-07 09:34:47','2025-04-07 09:34:47',NULL),(33,5,16,6,15000.00,'income','helth','2025-04-07',NULL,'2025-04-07 10:00:38','2025-04-07 10:00:38',NULL),(34,5,17,6,11700.00,'income','Hito ko diye','2025-04-04',NULL,'2025-04-07 10:37:49','2025-04-07 10:37:49',NULL),(35,5,18,6,350.00,'income','m','2025-04-02',NULL,'2025-04-07 10:42:59','2025-04-07 10:42:59',NULL),(36,5,19,6,650.00,'income','t','2025-04-02',NULL,'2025-04-07 10:44:12','2025-04-07 10:44:12',NULL),(37,9,20,7,10000.00,'income','Testing','2025-04-07',NULL,'2025-04-07 10:59:14','2025-04-07 10:59:14',NULL),(38,9,23,7,1000.00,'income','Mobile recharge','2025-04-08',NULL,'2025-04-07 11:01:44','2025-04-07 11:01:44',NULL),(39,9,22,7,5000.00,'income','Rent done','2025-04-10',NULL,'2025-04-07 11:02:08','2025-04-07 11:02:08',NULL),(40,9,25,7,2000.00,'income','Aata chawal','2025-04-11',NULL,'2025-04-07 11:02:35','2025-04-07 11:02:35',NULL),(41,9,21,7,1000.00,'income','Veg','2025-04-12',NULL,'2025-04-07 11:03:04','2025-04-07 11:03:04',NULL),(42,9,24,7,1000.00,'income','Shopping','2025-04-13',NULL,'2025-04-07 11:03:52','2025-04-07 11:03:52',NULL),(43,6,27,8,30000.00,'income','salary','2025-03-29',NULL,'2025-04-07 12:19:41','2025-04-07 12:19:41',NULL),(44,6,28,8,15000.00,'income','helth','2025-03-29',NULL,'2025-04-07 12:22:04','2025-04-07 12:22:04',NULL),(45,6,29,8,350.00,'income','350','2025-03-29',NULL,'2025-04-07 12:24:38','2025-04-07 12:24:38',NULL),(46,6,30,8,650.00,'income','cab','2025-03-29',NULL,'2025-04-07 12:26:38','2025-04-07 12:26:38',NULL),(47,9,24,7,1000.00,'income','Test','2025-03-01',NULL,'2025-04-07 12:39:41','2025-04-07 12:39:41',NULL),(48,6,31,8,10000.00,'income','Hito ko','2025-03-30',NULL,'2025-04-07 12:43:22','2025-04-07 12:43:22',NULL),(49,6,32,8,1757.00,'income','helth Insurance','2025-03-31',NULL,'2025-04-07 12:45:32','2025-04-07 12:45:32',NULL),(50,6,33,8,947.00,'income','10 liter Petrol','2025-04-01',NULL,'2025-04-07 12:46:21','2025-04-07 12:46:21',NULL),(51,6,26,8,60.00,'income','milk','2025-04-05',NULL,'2025-04-08 10:23:24','2025-04-08 10:23:24',NULL),(52,6,34,8,20.00,'income','bread','2025-04-08',NULL,'2025-04-08 10:25:01','2025-04-08 10:25:01',NULL),(53,6,35,8,400.00,'income','vegitable','2025-04-03',NULL,'2025-04-08 10:27:29','2025-04-08 10:27:29',NULL),(54,6,34,8,20.00,'income','gdfgdfgdf','2025-04-14',NULL,'2025-04-14 05:04:37','2025-04-14 05:04:37',NULL),(55,6,27,8,33200.00,'income','salary','2025-03-29',NULL,'2025-04-14 06:03:20','2025-04-14 06:03:20',NULL),(56,6,36,8,10400.00,'income','room rent','2025-04-10',NULL,'2025-04-15 11:32:58','2025-04-15 11:32:58',NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Test User','test@example.com','2025-03-24 08:44:40','$2y$12$Ed1nNu4oazmHfbq4uqA3P.KszS2UI7PqQNN9xnLqiKT0czjL9K9CG','ZVlqOHD57I','2025-03-24 08:44:40','2025-03-24 08:44:40'),(2,'Ajay','ajay@example.com',NULL,'$2y$12$z422ApsHFBVdmSTEJ8YV0u1nJUHmb8XpHNiQjEiiO2n8RTAL3oltW',NULL,'2025-03-24 08:49:29','2025-03-24 08:49:29'),(3,'Abhishek','abhishek@vert-age.com',NULL,'$2y$12$AzrzeOKc6RzcDe4j2bmZKeO8M1Qym0mUxyOZGucAPAXPce95cSdvG',NULL,'2025-03-26 07:26:27','2025-03-26 07:26:27'),(5,'AJAY','ajay@gmail.com',NULL,'z422ApsHFBVdmSTEJ8YV0u1nJUHmb8XpHNiQjEiiO2n8RTAL3oltW',NULL,'2025-04-07 08:51:56','2025-04-07 08:51:56'),(6,'Manish','manish@gmail.com',NULL,'$2y$12$eKuoDhJumD9JoKdA10QeVu2VTs.vE0d3B0v/ODXjWgcrXpL/UWvW6',NULL,'2025-04-07 10:54:00','2025-04-07 10:54:00'),(9,'Ajay','ajayrawat@gmail.com',NULL,'$2y$12$1RVfZ7/ryrc45p38mrz24OC/EhrGgMiyy2O2MpkGsjtrvayMo9y7W',NULL,'2025-04-07 10:57:13','2025-04-07 10:57:13');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-16  5:37:43
