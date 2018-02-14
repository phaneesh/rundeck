-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: rundeckdb
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_token`
--

DROP TABLE IF EXISTS `auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `auth_roles` longtext NOT NULL,
  `creator` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `expiration` datetime DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aiqc20kpjasth5bxogsragoif` (`user_id`),
  CONSTRAINT `FK_aiqc20kpjasth5bxogsragoif` FOREIGN KEY (`user_id`) REFERENCES `rduser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `base_report`
--

DROP TABLE IF EXISTS `base_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `action_type` varchar(256) NOT NULL,
  `author` varchar(255) NOT NULL,
  `ctx_name` varchar(255) DEFAULT NULL,
  `ctx_project` varchar(255) NOT NULL,
  `ctx_type` varchar(255) DEFAULT NULL,
  `date_completed` datetime NOT NULL,
  `date_started` datetime NOT NULL,
  `mapref_uri` varchar(255) DEFAULT NULL,
  `message` longtext NOT NULL,
  `node` varchar(255) DEFAULT NULL,
  `report_id` varchar(3072) DEFAULT NULL,
  `status` varchar(256) NOT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `title` longtext NOT NULL,
  `class` varchar(255) NOT NULL,
  `aborted_by_user` varchar(255) DEFAULT NULL,
  `adhoc_execution` bit(1) DEFAULT NULL,
  `adhoc_script` longtext,
  `ctx_command` varchar(255) DEFAULT NULL,
  `ctx_controller` varchar(255) DEFAULT NULL,
  `failed_node_list` longtext,
  `filter_applied` longtext,
  `jc_exec_id` varchar(255) DEFAULT NULL,
  `jc_job_id` varchar(255) DEFAULT NULL,
  `succeeded_node_list` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `execution`
--

DROP TABLE IF EXISTS `execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `execution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `abortedby` varchar(255) DEFAULT NULL,
  `arg_string` longtext,
  `cancelled` bit(1) NOT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_started` datetime DEFAULT NULL,
  `do_nodedispatch` bit(1) DEFAULT NULL,
  `execution_type` varchar(30) DEFAULT NULL,
  `failed_node_list` longtext,
  `filter` longtext,
  `loglevel` varchar(255) DEFAULT NULL,
  `node_exclude` longtext,
  `node_exclude_name` longtext,
  `node_exclude_os_arch` longtext,
  `node_exclude_os_family` longtext,
  `node_exclude_os_name` longtext,
  `node_exclude_os_version` longtext,
  `node_exclude_precedence` bit(1) DEFAULT NULL,
  `node_exclude_tags` longtext,
  `node_filter_editable` bit(1) DEFAULT NULL,
  `node_include` longtext,
  `node_include_name` longtext,
  `node_include_os_arch` longtext,
  `node_include_os_family` longtext,
  `node_include_os_name` longtext,
  `node_include_os_version` longtext,
  `node_include_tags` longtext,
  `node_keepgoing` bit(1) DEFAULT NULL,
  `node_rank_attribute` varchar(255) DEFAULT NULL,
  `node_rank_order_ascending` bit(1) DEFAULT NULL,
  `node_threadcount` int(11) DEFAULT NULL,
  `orchestrator_id` bigint(20) DEFAULT NULL,
  `outputfilepath` longtext,
  `project` varchar(255) NOT NULL,
  `retry` longtext,
  `retry_attempt` int(11) DEFAULT NULL,
  `retry_delay` varchar(255) DEFAULT NULL,
  `retry_execution_id` bigint(20) DEFAULT NULL,
  `scheduled_execution_id` bigint(20) DEFAULT NULL,
  `server_nodeuuid` varchar(36) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `succeeded_node_list` longtext,
  `success_on_empty_node_filter` bit(1) DEFAULT NULL,
  `timed_out` bit(1) DEFAULT NULL,
  `timeout` longtext,
  `rduser` varchar(255) NOT NULL,
  `user_role_list` longtext,
  `will_retry` bit(1) DEFAULT NULL,
  `workflow_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EXEC_IDX_4` (`date_completed`,`scheduled_execution_id`),
  KEY `FK_ltiukr4bdti8hclo49o2g6v9o` (`orchestrator_id`),
  KEY `FK_a908hrcn9u20eayg6akkepbl1` (`retry_execution_id`),
  KEY `FK_6shmc1y7sh51x03aovfualoka` (`scheduled_execution_id`),
  KEY `FK_fofkk7vj9h2bdcqqics5ustr6` (`workflow_id`),
  CONSTRAINT `FK_6shmc1y7sh51x03aovfualoka` FOREIGN KEY (`scheduled_execution_id`) REFERENCES `scheduled_execution` (`id`),
  CONSTRAINT `FK_a908hrcn9u20eayg6akkepbl1` FOREIGN KEY (`retry_execution_id`) REFERENCES `execution` (`id`),
  CONSTRAINT `FK_fofkk7vj9h2bdcqqics5ustr6` FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`id`),
  CONSTRAINT `FK_ltiukr4bdti8hclo49o2g6v9o` FOREIGN KEY (`orchestrator_id`) REFERENCES `orchestrator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `job_file_record`
--

DROP TABLE IF EXISTS `job_file_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job_file_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `execution_id` bigint(20) DEFAULT NULL,
  `expiration_date` datetime DEFAULT NULL,
  `file_name` varchar(1024) DEFAULT NULL,
  `file_state` varchar(255) NOT NULL,
  `job_id` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `project` varchar(255) NOT NULL,
  `record_name` varchar(255) DEFAULT NULL,
  `record_type` varchar(255) NOT NULL,
  `server_nodeuuid` longtext,
  `sha` varchar(64) NOT NULL,
  `SIZE` bigint(20) NOT NULL,
  `storage_meta` longtext,
  `storage_reference` longtext NOT NULL,
  `storage_type` varchar(255) NOT NULL,
  `rduser` varchar(255) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dgig9thteq37sidkc38msxep` (`execution_id`),
  CONSTRAINT `FK_dgig9thteq37sidkc38msxep` FOREIGN KEY (`execution_id`) REFERENCES `execution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_file_storage_request`
--

DROP TABLE IF EXISTS `log_file_storage_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_file_storage_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `completed` bit(1) NOT NULL,
  `date_created` datetime NOT NULL,
  `execution_id` bigint(20) NOT NULL,
  `filetype` varchar(255) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `plugin_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_trqsa9so0qcv6okcd6fan88yf` (`execution_id`),
  CONSTRAINT `FK_trqsa9so0qcv6okcd6fan88yf` FOREIGN KEY (`execution_id`) REFERENCES `execution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_filter`
--

DROP TABLE IF EXISTS `node_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_filter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `filter` longtext,
  `name` varchar(255) NOT NULL,
  `node_exclude` longtext,
  `node_exclude_name` longtext,
  `node_exclude_os_arch` longtext,
  `node_exclude_os_family` longtext,
  `node_exclude_os_name` longtext,
  `node_exclude_os_version` longtext,
  `node_exclude_precedence` bit(1) DEFAULT NULL,
  `node_exclude_tags` longtext,
  `node_include` longtext,
  `node_include_name` longtext,
  `node_include_os_arch` longtext,
  `node_include_os_family` longtext,
  `node_include_os_name` longtext,
  `node_include_os_version` longtext,
  `node_include_tags` longtext,
  `project` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_b7y0uh7dsiikf3gxn8rxvp1aj` (`user_id`),
  CONSTRAINT `FK_b7y0uh7dsiikf3gxn8rxvp1aj` FOREIGN KEY (`user_id`) REFERENCES `rduser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `content` longtext,
  `event_trigger` varchar(255) NOT NULL,
  `scheduled_execution_id` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jnk8qdbq6e3wwkcni79wcrewy` (`scheduled_execution_id`),
  CONSTRAINT `FK_jnk8qdbq6e3wwkcni79wcrewy` FOREIGN KEY (`scheduled_execution_id`) REFERENCES `scheduled_execution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orchestrator`
--

DROP TABLE IF EXISTS `orchestrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orchestrator` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `content` longtext,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugin_meta`
--

DROP TABLE IF EXISTS `plugin_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_meta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `json_data` longtext,
  `data_key` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `project` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rdoption`
--

DROP TABLE IF EXISTS `rdoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdoption` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `config_data` longtext,
  `date_format` varchar(30) DEFAULT NULL,
  `default_storage_path` varchar(255) DEFAULT NULL,
  `default_value` longtext,
  `delimiter` varchar(255) DEFAULT NULL,
  `description` longtext,
  `enforced` bit(1) NOT NULL,
  `is_date` bit(1) DEFAULT NULL,
  `multivalue_all_selected` bit(1) DEFAULT NULL,
  `multivalued` bit(1) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `option_type` longtext,
  `regex` longtext,
  `required` bit(1) DEFAULT NULL,
  `scheduled_execution_id` bigint(20) DEFAULT NULL,
  `secure_exposed` bit(1) DEFAULT NULL,
  `secure_input` bit(1) DEFAULT NULL,
  `sort_index` int(11) DEFAULT NULL,
  `values_url` varchar(255) DEFAULT NULL,
  `values_url_long` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jraxrdpul0ne9eediy1xjlsfv` (`scheduled_execution_id`),
  CONSTRAINT `FK_jraxrdpul0ne9eediy1xjlsfv` FOREIGN KEY (`scheduled_execution_id`) REFERENCES `scheduled_execution` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rdoption_values`
--

DROP TABLE IF EXISTS `rdoption_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdoption_values` (
  `option_id` bigint(20) DEFAULT NULL,
  `values_string` longtext,
  KEY `FK_p6s9n018km1emn0a0q04ygc72` (`option_id`),
  CONSTRAINT `FK_p6s9n018km1emn0a0q04ygc72` FOREIGN KEY (`option_id`) REFERENCES `rdoption` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rduser`
--

DROP TABLE IF EXISTS `rduser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rduser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `dashboard_pref` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `filter_pref` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report_filter`
--

DROP TABLE IF EXISTS `report_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_filter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `cmd_filter` varchar(255) DEFAULT NULL,
  `doendafter_filter` bit(1) NOT NULL,
  `doendbefore_filter` bit(1) NOT NULL,
  `dostartafter_filter` bit(1) NOT NULL,
  `dostartbefore_filter` bit(1) NOT NULL,
  `endafter_filter` datetime DEFAULT NULL,
  `endbefore_filter` datetime DEFAULT NULL,
  `execnode_filter` varchar(255) DEFAULT NULL,
  `job_filter` varchar(255) DEFAULT NULL,
  `job_id_filter` varchar(255) DEFAULT NULL,
  `mapref_uri_filter` varchar(255) DEFAULT NULL,
  `message_filter` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `node_filter` varchar(255) DEFAULT NULL,
  `obj_filter` varchar(255) DEFAULT NULL,
  `proj_filter` varchar(255) NOT NULL,
  `recent_filter` varchar(255) DEFAULT NULL,
  `report_id_filter` varchar(255) DEFAULT NULL,
  `startafter_filter` datetime DEFAULT NULL,
  `startbefore_filter` datetime DEFAULT NULL,
  `stat_filter` varchar(255) DEFAULT NULL,
  `tags_filter` varchar(255) DEFAULT NULL,
  `title_filter` varchar(255) DEFAULT NULL,
  `type_filter` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `user_filter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bfos9o64cnd2i2xfnx7il0tix` (`user_id`),
  CONSTRAINT `FK_bfos9o64cnd2i2xfnx7il0tix` FOREIGN KEY (`user_id`) REFERENCES `rduser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduled_execution`
--

DROP TABLE IF EXISTS `scheduled_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_execution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `arg_string` longtext,
  `date_created` datetime NOT NULL,
  `day_of_month` varchar(255) DEFAULT NULL,
  `day_of_week` varchar(255) DEFAULT NULL,
  `description` longtext,
  `do_nodedispatch` bit(1) DEFAULT NULL,
  `exec_count` bigint(20) DEFAULT NULL,
  `execution_enabled` bit(1) DEFAULT NULL,
  `filter` longtext,
  `group_path` varchar(2048) DEFAULT NULL,
  `hour` varchar(255) DEFAULT NULL,
  `job_name` varchar(1024) NOT NULL,
  `last_updated` datetime NOT NULL,
  `log_output_threshold` varchar(256) DEFAULT NULL,
  `log_output_threshold_action` varchar(256) DEFAULT NULL,
  `log_output_threshold_status` varchar(256) DEFAULT NULL,
  `loglevel` varchar(255) DEFAULT NULL,
  `minute` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `multiple_executions` bit(1) DEFAULT NULL,
  `next_execution` datetime DEFAULT NULL,
  `node_exclude` longtext,
  `node_exclude_name` longtext,
  `node_exclude_os_arch` longtext,
  `node_exclude_os_family` longtext,
  `node_exclude_os_name` longtext,
  `node_exclude_os_version` longtext,
  `node_exclude_precedence` bit(1) DEFAULT NULL,
  `node_exclude_tags` longtext,
  `node_filter_editable` bit(1) DEFAULT NULL,
  `node_include` longtext,
  `node_include_name` longtext,
  `node_include_os_arch` longtext,
  `node_include_os_family` longtext,
  `node_include_os_name` longtext,
  `node_include_os_version` longtext,
  `node_include_tags` longtext,
  `node_keepgoing` bit(1) DEFAULT NULL,
  `node_rank_attribute` varchar(255) DEFAULT NULL,
  `node_rank_order_ascending` bit(1) DEFAULT NULL,
  `node_threadcount` int(11) DEFAULT NULL,
  `nodes_selected_by_default` bit(1) DEFAULT NULL,
  `orchestrator_id` bigint(20) DEFAULT NULL,
  `project` varchar(255) NOT NULL,
  `retry` longtext,
  `retry_delay` longtext,
  `schedule_enabled` bit(1) DEFAULT NULL,
  `scheduled` bit(1) NOT NULL,
  `seconds` varchar(255) DEFAULT NULL,
  `server_nodeuuid` varchar(36) DEFAULT NULL,
  `success_on_empty_node_filter` bit(1) DEFAULT NULL,
  `time_zone` varchar(256) DEFAULT NULL,
  `timeout` longtext,
  `total_time` bigint(20) DEFAULT NULL,
  `rduser` varchar(255) DEFAULT NULL,
  `user_role_list` longtext,
  `uuid` varchar(255) DEFAULT NULL,
  `workflow_id` bigint(20) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mns7yxw0cx9msuk59x9f2b4lv` (`orchestrator_id`),
  KEY `FK_jln7b7a683uwkl4fg6kpacqnp` (`workflow_id`),
  CONSTRAINT `FK_jln7b7a683uwkl4fg6kpacqnp` FOREIGN KEY (`workflow_id`) REFERENCES `workflow` (`id`),
  CONSTRAINT `FK_mns7yxw0cx9msuk59x9f2b4lv` FOREIGN KEY (`orchestrator_id`) REFERENCES `orchestrator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduled_execution_filter`
--

DROP TABLE IF EXISTS `scheduled_execution_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduled_execution_filter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `desc_filter` varchar(255) DEFAULT NULL,
  `group_path` varchar(255) DEFAULT NULL,
  `idlist` varchar(255) DEFAULT NULL,
  `job_filter` varchar(255) DEFAULT NULL,
  `loglevel_filter` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `proj_filter` varchar(255) DEFAULT NULL,
  `scheduled_filter` varchar(255) DEFAULT NULL,
  `server_nodeuuidfilter` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6r7ok07n10vbsbl6f1ck2h58u` (`user_id`),
  CONSTRAINT `FK_6r7ok07n10vbsbl6f1ck2h58u` FOREIGN KEY (`user_id`) REFERENCES `rduser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `data` longblob,
  `date_created` datetime NOT NULL,
  `dir` varchar(2048) DEFAULT NULL,
  `json_data` longtext,
  `last_updated` datetime NOT NULL,
  `name` varchar(1024) NOT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  `path_sha` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ow5u86267bvtsol1k9xsox40i` (`path_sha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workflow`
--

DROP TABLE IF EXISTS `workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `keepgoing` bit(1) NOT NULL,
  `plugin_config` longtext,
  `strategy` varchar(256) NOT NULL,
  `threadcount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workflow_step`
--

DROP TABLE IF EXISTS `workflow_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_step` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `error_handler_id` bigint(20) DEFAULT NULL,
  `keepgoing_on_success` bit(1) DEFAULT NULL,
  `plugin_config_data` longtext,
  `class` varchar(255) NOT NULL,
  `json_data` longtext,
  `node_step` bit(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `arg_string` longtext,
  `job_group` varchar(2048) DEFAULT NULL,
  `job_name` varchar(1024) DEFAULT NULL,
  `job_project` varchar(2048) DEFAULT NULL,
  `node_filter` longtext,
  `node_intersect` bit(1) DEFAULT NULL,
  `node_keepgoing` bit(1) DEFAULT NULL,
  `node_rank_attribute` longtext,
  `node_rank_order_ascending` bit(1) DEFAULT NULL,
  `node_threadcount` int(11) DEFAULT NULL,
  `adhoc_execution` bit(1) DEFAULT NULL,
  `adhoc_filepath` longtext,
  `adhoc_local_string` longtext,
  `adhoc_remote_string` longtext,
  `file_extension` longtext,
  `interpreter_args_quoted` bit(1) DEFAULT NULL,
  `script_interpreter` longtext,
  PRIMARY KEY (`id`),
  KEY `FK_8bbf05v4f6vo5o3cgp69awcue` (`error_handler_id`),
  CONSTRAINT `FK_8bbf05v4f6vo5o3cgp69awcue` FOREIGN KEY (`error_handler_id`) REFERENCES `workflow_step` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workflow_workflow_step`
--

DROP TABLE IF EXISTS `workflow_workflow_step`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_workflow_step` (
  `workflow_commands_id` bigint(20) DEFAULT NULL,
  `workflow_step_id` bigint(20) DEFAULT NULL,
  `commands_idx` int(11) DEFAULT NULL,
  KEY `WORKFLOW_COMMANDS_IDX_0` (`workflow_commands_id`),
  KEY `FK_9pkey6k5fdo6worgquakkh7d1` (`workflow_step_id`),
  CONSTRAINT `FK_9pkey6k5fdo6worgquakkh7d1` FOREIGN KEY (`workflow_step_id`) REFERENCES `workflow_step` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-14  7:50:57
