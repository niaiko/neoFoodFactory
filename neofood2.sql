-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 21 juin 2021 à 13:51
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `neofood2`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `streetLine1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `streetLine2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `postalCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `defaultShippingAddress` tinyint(4) NOT NULL DEFAULT '0',
  `defaultBillingAddress` tinyint(4) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `customFieldsLong` double DEFAULT NULL,
  `customFieldsLat` double DEFAULT NULL,
  `customFieldsPays` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customFieldsFulladdress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dc34d382b493ade1f70e834c4d3` (`customerId`),
  KEY `FK_d87215343c3a3a67e6a0b7f3ea9` (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE IF NOT EXISTS `administrator` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailAddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_154f5c538b1576ccc277b1ed63` (`emailAddress`),
  UNIQUE KEY `REL_1966e18ce6a39a82b19204704d` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `administrator`
--

INSERT INTO `administrator` (`createdAt`, `updatedAt`, `deletedAt`, `firstName`, `lastName`, `emailAddress`, `id`, `userId`) VALUES
('2021-06-21 16:29:48.891777', '2021-06-21 16:29:48.891777', NULL, 'Super', 'Admin', 'superadmin', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `asset`
--

DROP TABLE IF EXISTS `asset`;
CREATE TABLE IF NOT EXISTS `asset` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mimeType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` int(11) NOT NULL DEFAULT '0',
  `height` int(11) NOT NULL DEFAULT '0',
  `fileSize` int(11) NOT NULL,
  `source` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preview` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `focalPoint` text COLLATE utf8mb4_unicode_ci,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `asset_channels_channel`
--

DROP TABLE IF EXISTS `asset_channels_channel`;
CREATE TABLE IF NOT EXISTS `asset_channels_channel` (
  `assetId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`assetId`,`channelId`),
  KEY `IDX_dc4e7435f9f5e9e6436bebd33b` (`assetId`),
  KEY `IDX_16ca9151a5153f1169da5b7b7e` (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `asset_tags_tag`
--

DROP TABLE IF EXISTS `asset_tags_tag`;
CREATE TABLE IF NOT EXISTS `asset_tags_tag` (
  `assetId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  PRIMARY KEY (`assetId`,`tagId`),
  KEY `IDX_9e412b00d4c6cee1a4b3d92071` (`assetId`),
  KEY `IDX_fb5e800171ffbe9823f2cc727f` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `authentication_method`
--

DROP TABLE IF EXISTS `authentication_method`;
CREATE TABLE IF NOT EXISTS `authentication_method` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwordHash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verificationToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passwordResetToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identifierChangeToken` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pendingIdentifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `strategy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `externalIdentifier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_a23445b2c942d8dfcae15b8de2` (`type`),
  KEY `FK_00cbe87bc0d4e36758d61bd31d6` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `authentication_method`
--

INSERT INTO `authentication_method` (`createdAt`, `updatedAt`, `identifier`, `passwordHash`, `verificationToken`, `passwordResetToken`, `identifierChangeToken`, `pendingIdentifier`, `strategy`, `externalIdentifier`, `metadata`, `id`, `type`, `userId`) VALUES
('2021-06-21 16:29:48.506110', '2021-06-21 16:29:48.000000', 'superadmin', '$2b$12$V3Tl4pgUAhTZ0AJvVN1DG.Uxc0eQ00guWfomK2LNO4MsVR0/Vkaxy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'NativeAuthenticationMethod', 1),
('2021-06-21 16:32:43.923450', '2021-06-21 16:45:26.000000', 'Manda@gmail.com', '$2b$12$r.LTzEpUbJAdBhJnTq5K9.UD1m/Y9OGEViwYJYrRTeP20ZP/1iCc2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'NativeAuthenticationMethod', 2);

-- --------------------------------------------------------

--
-- Structure de la table `channel`
--

DROP TABLE IF EXISTS `channel`;
CREATE TABLE IF NOT EXISTS `channel` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defaultLanguageCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currencyCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pricesIncludeTax` tinyint(4) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `defaultTaxZoneId` int(11) DEFAULT NULL,
  `defaultShippingZoneId` int(11) DEFAULT NULL,
  `logoId` int(11) DEFAULT NULL,
  `imageCoverId` int(11) DEFAULT NULL,
  `customFieldsAdresschannel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customFieldsEmailadress` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customFieldsTelephone` int(11) DEFAULT NULL,
  `customFieldsOuverturemagasin` text COLLATE utf8mb4_unicode_ci,
  `customFieldsOuvertureservice` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_06127ac6c6d913f4320759971d` (`code`),
  UNIQUE KEY `IDX_842699fce4f3470a7d06d89de8` (`token`),
  KEY `FK_afe9f917a1c82b9e9e69f7c6129` (`defaultTaxZoneId`),
  KEY `FK_c9ca2f58d4517460435cbd8b4c9` (`defaultShippingZoneId`),
  KEY `FK_d4709364b2fb8a69c6f6e1222ae` (`logoId`),
  KEY `FK_3140d1ef2973ea15a51c8c33ea7` (`imageCoverId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `channel`
--

INSERT INTO `channel` (`createdAt`, `updatedAt`, `code`, `token`, `defaultLanguageCode`, `currencyCode`, `pricesIncludeTax`, `id`, `defaultTaxZoneId`, `defaultShippingZoneId`, `logoId`, `imageCoverId`, `customFieldsAdresschannel`, `customFieldsEmailadress`, `customFieldsTelephone`, `customFieldsOuverturemagasin`, `customFieldsOuvertureservice`) VALUES
('2021-06-21 16:29:47.070461', '2021-06-21 16:31:39.000000', '__default_channel__', '8dv7rymv1ioh0zhsfxt', 'en', 'USD', 1, 1, 1, 1, NULL, NULL, 'addresse', 'mail', 1561541, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `collection`
--

DROP TABLE IF EXISTS `collection`;
CREATE TABLE IF NOT EXISTS `collection` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `isRoot` tinyint(4) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL,
  `isPrivate` tinyint(4) NOT NULL DEFAULT '0',
  `filters` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `featuredAssetId` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7256fef1bb42f1b38156b7449f5` (`featuredAssetId`),
  KEY `FK_4257b61275144db89fa0f5dc059` (`parentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `collection_asset`
--

DROP TABLE IF EXISTS `collection_asset`;
CREATE TABLE IF NOT EXISTS `collection_asset` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `assetId` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `collectionId` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK_51da53b26522dc0525762d2de8e` (`assetId`),
  KEY `FK_1ed9e48dfbf74b5fcbb35d3d686` (`collectionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `collection_channels_channel`
--

DROP TABLE IF EXISTS `collection_channels_channel`;
CREATE TABLE IF NOT EXISTS `collection_channels_channel` (
  `collectionId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`collectionId`,`channelId`),
  KEY `IDX_cdbf33ffb5d451916125152008` (`collectionId`),
  KEY `IDX_7216ab24077cf5cbece7857dbb` (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `collection_product_variants_product_variant`
--

DROP TABLE IF EXISTS `collection_product_variants_product_variant`;
CREATE TABLE IF NOT EXISTS `collection_product_variants_product_variant` (
  `collectionId` int(11) NOT NULL,
  `productVariantId` int(11) NOT NULL,
  PRIMARY KEY (`collectionId`,`productVariantId`),
  KEY `IDX_6faa7b72422d9c4679e2f186ad` (`collectionId`),
  KEY `IDX_fb05887e2867365f236d7dd95e` (`productVariantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `collection_translation`
--

DROP TABLE IF EXISTS `collection_translation`;
CREATE TABLE IF NOT EXISTS `collection_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `languageCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e329f9036210d75caa1d8f2154a` (`baseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `country`
--

INSERT INTO `country` (`createdAt`, `updatedAt`, `code`, `enabled`, `id`) VALUES
('2021-06-21 16:30:38.977515', '2021-06-21 16:30:38.977515', 'fr', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `country_translation`
--

DROP TABLE IF EXISTS `country_translation`;
CREATE TABLE IF NOT EXISTS `country_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `languageCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_20958e5bdb4c996c18ca63d18e4` (`baseId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `country_translation`
--

INSERT INTO `country_translation` (`createdAt`, `updatedAt`, `languageCode`, `name`, `id`, `baseId`) VALUES
('2021-06-21 16:30:38.974000', '2021-06-21 16:30:38.000000', 'en', 'France', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emailAddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `avatarId` int(11) DEFAULT NULL,
  `customFieldsFavorites` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_3f62b42ed23958b120c235f74d` (`userId`),
  KEY `FK_7a9d34477964f14ecac6e9fe037` (`avatarId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `customer`
--

INSERT INTO `customer` (`createdAt`, `updatedAt`, `deletedAt`, `title`, `firstName`, `lastName`, `phoneNumber`, `emailAddress`, `id`, `userId`, `avatarId`, `customFieldsFavorites`) VALUES
('2021-06-21 16:32:43.391826', '2021-06-21 16:32:44.000000', NULL, '', 'Manda', 'Onirique', '+261 9796568695', 'manda@gmail.com', 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `customer_channels_channel`
--

DROP TABLE IF EXISTS `customer_channels_channel`;
CREATE TABLE IF NOT EXISTS `customer_channels_channel` (
  `customerId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`customerId`,`channelId`),
  KEY `IDX_a842c9fe8cd4c8ff31402d172d` (`customerId`),
  KEY `IDX_dc9f69207a8867f83b0fd257e3` (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `customer_channels_channel`
--

INSERT INTO `customer_channels_channel` (`customerId`, `channelId`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `customer_group`
--

DROP TABLE IF EXISTS `customer_group`;
CREATE TABLE IF NOT EXISTS `customer_group` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `customer_groups_customer_group`
--

DROP TABLE IF EXISTS `customer_groups_customer_group`;
CREATE TABLE IF NOT EXISTS `customer_groups_customer_group` (
  `customerId` int(11) NOT NULL,
  `customerGroupId` int(11) NOT NULL,
  PRIMARY KEY (`customerId`,`customerGroupId`),
  KEY `IDX_b823a3c8bf3b78d3ed68736485` (`customerId`),
  KEY `IDX_85feea3f0e5e82133605f78db0` (`customerGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facet`
--

DROP TABLE IF EXISTS `facet`;
CREATE TABLE IF NOT EXISTS `facet` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `isPrivate` tinyint(4) NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_0c9a5d053fdf4ebb5f0490b40f` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facet_channels_channel`
--

DROP TABLE IF EXISTS `facet_channels_channel`;
CREATE TABLE IF NOT EXISTS `facet_channels_channel` (
  `facetId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`facetId`,`channelId`),
  KEY `IDX_ca796020c6d097e251e5d6d2b0` (`facetId`),
  KEY `IDX_2a8ea404d05bf682516184db7d` (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facet_translation`
--

DROP TABLE IF EXISTS `facet_translation`;
CREATE TABLE IF NOT EXISTS `facet_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `languageCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_eaea53f44bf9e97790d38a3d68f` (`baseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facet_value`
--

DROP TABLE IF EXISTS `facet_value`;
CREATE TABLE IF NOT EXISTS `facet_value` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d101dc2265a7341be3d94968c5b` (`facetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facet_value_channels_channel`
--

DROP TABLE IF EXISTS `facet_value_channels_channel`;
CREATE TABLE IF NOT EXISTS `facet_value_channels_channel` (
  `facetValueId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`facetValueId`,`channelId`),
  KEY `IDX_ad690c1b05596d7f52e52ffeed` (`facetValueId`),
  KEY `IDX_e1d54c0b9db3e2eb17faaf5919` (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `facet_value_translation`
--

DROP TABLE IF EXISTS `facet_value_translation`;
CREATE TABLE IF NOT EXISTS `facet_value_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `languageCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3d6e45823b65de808a66cb1423b` (`baseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
CREATE TABLE IF NOT EXISTS `favorite` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_543e20855ce2bde06d0acb29b51` (`customerId`),
  KEY `FK_b8e337759b77baa0a4055d1894e` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fulfillment`
--

DROP TABLE IF EXISTS `fulfillment`;
CREATE TABLE IF NOT EXISTS `fulfillment` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trackingCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `handlerCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `global_settings`
--

DROP TABLE IF EXISTS `global_settings`;
CREATE TABLE IF NOT EXISTS `global_settings` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `availableLanguages` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `trackInventory` tinyint(4) NOT NULL DEFAULT '1',
  `outOfStockThreshold` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `global_settings`
--

INSERT INTO `global_settings` (`createdAt`, `updatedAt`, `availableLanguages`, `trackInventory`, `outOfStockThreshold`, `id`) VALUES
('2021-06-21 16:29:46.946040', '2021-06-21 16:29:46.946040', 'en', 1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `history_entry`
--

DROP TABLE IF EXISTS `history_entry`;
CREATE TABLE IF NOT EXISTS `history_entry` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isPublic` tinyint(4) NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discriminator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administratorId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_f3a761f6bcfabb474b11e1e51f` (`discriminator`),
  KEY `FK_92f8c334ef06275f9586fd01832` (`administratorId`),
  KEY `FK_43ac602f839847fdb91101f30ec` (`customerId`),
  KEY `FK_3a05127e67435b4d2332ded7c9e` (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `history_entry`
--

INSERT INTO `history_entry` (`createdAt`, `updatedAt`, `type`, `isPublic`, `data`, `id`, `discriminator`, `administratorId`, `customerId`, `orderId`) VALUES
('2021-06-21 13:32:43.395000', '2021-06-21 16:32:43.398472', 'CUSTOMER_REGISTERED', 0, '{\"strategy\":\"native\"}', 1, 'CustomerHistoryEntry', NULL, 1, NULL),
('2021-06-21 13:32:44.426000', '2021-06-21 16:32:44.428402', 'CUSTOMER_VERIFIED', 0, '{\"strategy\":\"native\"}', 2, 'CustomerHistoryEntry', NULL, 1, NULL),
('2021-06-21 13:32:46.047000', '2021-06-21 16:32:46.049644', 'CUSTOMER_ADDRESS_CREATED', 0, '{\"address\":\"Palais du Sénat, Anosy, --, France\"}', 3, 'CustomerHistoryEntry', NULL, 1, NULL),
('2021-06-21 13:33:10.429000', '2021-06-21 16:33:10.431611', 'CUSTOMER_ADDRESS_CREATED', 0, '{\"address\":\"Palais du Sénat, Anosy, --, France\"}', 4, 'CustomerHistoryEntry', NULL, 1, NULL),
('2021-06-21 13:33:30.019000', '2021-06-21 16:33:30.022297', 'CUSTOMER_ADDRESS_UPDATED', 0, '{\"address\":\"Palais du Sénat, Anosy, --, France\",\"input\":{\"id\":1,\"fullName\":\"Domicile 😍\",\"streetLine1\":\"Palais du Sénat, Anosy\",\"streetLine2\":\"--\",\"city\":\"Antananarivo\",\"province\":\"Antananarivo Province\",\"postalCode\":\"--\",\"countryCode\":\"FR\",\"customFields\":{\"long\":47.5214816,\"lat\":-18.9187814,\"pays\":\"Madagascar\",\"fullAddress\":\"Senate\'s Palace, Palais du Sénat, Anosy, Antananarivo, Madagascar\"}}}', 5, 'CustomerHistoryEntry', NULL, 1, NULL),
('2021-06-21 13:37:43.242000', '2021-06-21 16:37:43.248026', 'CUSTOMER_ADDRESS_UPDATED', 0, '{\"address\":\"2207, 44113, France\",\"input\":{\"id\":1,\"fullName\":\"Domicile 😍\",\"streetLine1\":\"2207\",\"streetLine2\":\"Seymour Avenue\",\"city\":\"Cleveland\",\"province\":\"Ohio\",\"postalCode\":\"44113\",\"countryCode\":\"FR\",\"customFields\":{\"long\":-81.6978824,\"lat\":41.4726046,\"pays\":\"United States\",\"fullAddress\":\"2207 Seymour Avenue, Cleveland, Ohio, États-Unis\"}}}', 6, 'CustomerHistoryEntry', NULL, 1, NULL),
('2021-06-21 13:41:03.066000', '2021-06-21 16:41:03.067904', 'CUSTOMER_ADDRESS_DELETED', 0, '{\"address\":\"2207, 44113, France\"}', 7, 'CustomerHistoryEntry', NULL, 1, NULL),
('2021-06-21 13:43:51.891000', '2021-06-21 16:43:51.893885', 'CUSTOMER_ADDRESS_DELETED', 0, '{\"address\":\"Palais du Sénat, Anosy, --, France\"}', 8, 'CustomerHistoryEntry', NULL, 1, NULL),
('2021-06-21 13:45:26.238000', '2021-06-21 16:45:26.242707', 'CUSTOMER_PASSWORD_UPDATED', 0, '{}', 9, 'CustomerHistoryEntry', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `job_record`
--

DROP TABLE IF EXISTS `job_record`;
CREATE TABLE IF NOT EXISTS `job_record` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `queueName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `progress` int(11) NOT NULL,
  `result` text COLLATE utf8mb4_unicode_ci,
  `error` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `startedAt` datetime(6) DEFAULT NULL,
  `settledAt` datetime(6) DEFAULT NULL,
  `isSettled` tinyint(4) NOT NULL,
  `retries` int(11) NOT NULL,
  `attempts` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `orderPlacedAt` datetime DEFAULT NULL,
  `couponCodes` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shippingAddress` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `billingAddress` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `currencyCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subTotal` int(11) NOT NULL,
  `subTotalWithTax` int(11) NOT NULL,
  `shipping` int(11) NOT NULL DEFAULT '0',
  `shippingWithTax` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxZoneId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_124456e637cca7a415897dce659` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_channels_channel`
--

DROP TABLE IF EXISTS `order_channels_channel`;
CREATE TABLE IF NOT EXISTS `order_channels_channel` (
  `orderId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`orderId`,`channelId`),
  KEY `IDX_0d8e5c204480204a60e151e485` (`orderId`),
  KEY `IDX_d0d16db872499e83b15999f8c7` (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
CREATE TABLE IF NOT EXISTS `order_item` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `initialListPrice` int(11) DEFAULT NULL,
  `listPrice` int(11) NOT NULL,
  `listPriceIncludesTax` tinyint(4) NOT NULL,
  `adjustments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxLines` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancelled` tinyint(4) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lineId` int(11) NOT NULL,
  `refundId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_69384323444206753f0cdeb64e0` (`lineId`),
  KEY `FK_3e5161133689fba526377cbccd3` (`refundId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_item_fulfillments_fulfillment`
--

DROP TABLE IF EXISTS `order_item_fulfillments_fulfillment`;
CREATE TABLE IF NOT EXISTS `order_item_fulfillments_fulfillment` (
  `orderItemId` int(11) NOT NULL,
  `fulfillmentId` int(11) NOT NULL,
  PRIMARY KEY (`orderItemId`,`fulfillmentId`),
  KEY `IDX_a568a3d5aa7f237edab624960b` (`orderItemId`),
  KEY `IDX_8132041a647c28eb27ecc1691f` (`fulfillmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
CREATE TABLE IF NOT EXISTS `order_line` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productVariantId` int(11) DEFAULT NULL,
  `taxCategoryId` int(11) DEFAULT NULL,
  `featuredAssetId` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cbcd22193eda94668e84d33f185` (`productVariantId`),
  KEY `FK_77be94ce9ec6504466179462275` (`taxCategoryId`),
  KEY `FK_9f065453910ea77d4be8e92618f` (`featuredAssetId`),
  KEY `FK_239cfca2a55b98b90b6bef2e44f` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_modification`
--

DROP TABLE IF EXISTS `order_modification`;
CREATE TABLE IF NOT EXISTS `order_modification` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priceChange` int(11) NOT NULL,
  `shippingAddressChange` text COLLATE utf8mb4_unicode_ci,
  `billingAddressChange` text COLLATE utf8mb4_unicode_ci,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `paymentId` int(11) DEFAULT NULL,
  `refundId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_ad2991fa2933ed8b7f86a71633` (`paymentId`),
  UNIQUE KEY `REL_cb66b63b6e97613013795eadbd` (`refundId`),
  KEY `FK_1df5bc14a47ef24d2e681f45598` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_modification_order_items_order_item`
--

DROP TABLE IF EXISTS `order_modification_order_items_order_item`;
CREATE TABLE IF NOT EXISTS `order_modification_order_items_order_item` (
  `orderModificationId` int(11) NOT NULL,
  `orderItemId` int(11) NOT NULL,
  PRIMARY KEY (`orderModificationId`,`orderItemId`),
  KEY `IDX_a48502a38aded69d087a8ec08a` (`orderModificationId`),
  KEY `IDX_9d631d7bd3d44af50eca535d72` (`orderItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_promotions_promotion`
--

DROP TABLE IF EXISTS `order_promotions_promotion`;
CREATE TABLE IF NOT EXISTS `order_promotions_promotion` (
  `orderId` int(11) NOT NULL,
  `promotionId` int(11) NOT NULL,
  PRIMARY KEY (`orderId`,`promotionId`),
  KEY `IDX_67be0e40122ab30a62a9817efe` (`orderId`),
  KEY `IDX_2c26b988769c0e3b0120bdef31` (`promotionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `errorMessage` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transactionId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d09d285fe1645cd2f0db811e293` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
CREATE TABLE IF NOT EXISTS `payment_method` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(4) NOT NULL,
  `checker` text COLLATE utf8mb4_unicode_ci,
  `handler` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payment_method_channels_channel`
--

DROP TABLE IF EXISTS `payment_method_channels_channel`;
CREATE TABLE IF NOT EXISTS `payment_method_channels_channel` (
  `paymentMethodId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`paymentMethodId`,`channelId`),
  KEY `IDX_5bcb569635ce5407eb3f264487` (`paymentMethodId`),
  KEY `IDX_c00e36f667d35031087b382e61` (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `featuredAssetId` int(11) DEFAULT NULL,
  `customFieldsProductrecommendationsenabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_91a19e6613534949a4ce6e76ff8` (`featuredAssetId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_asset`
--

DROP TABLE IF EXISTS `product_asset`;
CREATE TABLE IF NOT EXISTS `product_asset` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `assetId` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK_5888ac17b317b93378494a10620` (`assetId`),
  KEY `FK_0d1294f5c22a56da7845ebab72c` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_channels_channel`
--

DROP TABLE IF EXISTS `product_channels_channel`;
CREATE TABLE IF NOT EXISTS `product_channels_channel` (
  `productId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`productId`,`channelId`),
  KEY `IDX_26d12be3b5fec6c4adb1d79284` (`productId`),
  KEY `IDX_a51dfbd87c330c075c39832b6e` (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_facet_values_facet_value`
--

DROP TABLE IF EXISTS `product_facet_values_facet_value`;
CREATE TABLE IF NOT EXISTS `product_facet_values_facet_value` (
  `productId` int(11) NOT NULL,
  `facetValueId` int(11) NOT NULL,
  PRIMARY KEY (`productId`,`facetValueId`),
  KEY `IDX_6a0558e650d75ae639ff38e413` (`productId`),
  KEY `IDX_06e7d73673ee630e8ec50d0b29` (`facetValueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_option`
--

DROP TABLE IF EXISTS `product_option`;
CREATE TABLE IF NOT EXISTS `product_option` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a6debf9198e2fbfa006aa10d710` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_option_group`
--

DROP TABLE IF EXISTS `product_option_group`;
CREATE TABLE IF NOT EXISTS `product_option_group` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a6e91739227bf4d442f23c52c75` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_option_group_translation`
--

DROP TABLE IF EXISTS `product_option_group_translation`;
CREATE TABLE IF NOT EXISTS `product_option_group_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `languageCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_93751abc1451972c02e033b766c` (`baseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_option_translation`
--

DROP TABLE IF EXISTS `product_option_translation`;
CREATE TABLE IF NOT EXISTS `product_option_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `languageCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a79a443c1f7841f3851767faa6d` (`baseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_recommendation`
--

DROP TABLE IF EXISTS `product_recommendation`;
CREATE TABLE IF NOT EXISTS `product_recommendation` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `type` enum('CROSSSELL','UPSELL') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) NOT NULL,
  `recommendationId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_0e5b7189b01aeb4fe80d0e959e2` (`productId`),
  KEY `FK_dbc55f2536f73447d607ef03a2f` (`recommendationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_translation`
--

DROP TABLE IF EXISTS `product_translation`;
CREATE TABLE IF NOT EXISTS `product_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `languageCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7dbc75cb4e8b002620c4dbfdac5` (`baseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_variant`
--

DROP TABLE IF EXISTS `product_variant`;
CREATE TABLE IF NOT EXISTS `product_variant` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stockOnHand` int(11) NOT NULL DEFAULT '0',
  `stockAllocated` int(11) NOT NULL DEFAULT '0',
  `outOfStockThreshold` int(11) NOT NULL DEFAULT '0',
  `useGlobalOutOfStockThreshold` tinyint(4) NOT NULL DEFAULT '1',
  `trackInventory` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INHERIT',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `featuredAssetId` int(11) DEFAULT NULL,
  `taxCategoryId` int(11) DEFAULT NULL,
  `customFieldsDiscountprice` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_0e6f516053cf982b537836e21cf` (`featuredAssetId`),
  KEY `FK_e38dca0d82fd64c7cf8aac8b8ef` (`taxCategoryId`),
  KEY `FK_6e420052844edf3a5506d863ce6` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_variant_asset`
--

DROP TABLE IF EXISTS `product_variant_asset`;
CREATE TABLE IF NOT EXISTS `product_variant_asset` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `assetId` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `productVariantId` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `FK_10b5a2e3dee0e30b1e26c32f5c7` (`assetId`),
  KEY `FK_fa21412afac15a2304f3eb35feb` (`productVariantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_variant_channels_channel`
--

DROP TABLE IF EXISTS `product_variant_channels_channel`;
CREATE TABLE IF NOT EXISTS `product_variant_channels_channel` (
  `productVariantId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`productVariantId`,`channelId`),
  KEY `IDX_beeb2b3cd800e589f2213ae99d` (`productVariantId`),
  KEY `IDX_d194bff171b62357688a5d0f55` (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_variant_facet_values_facet_value`
--

DROP TABLE IF EXISTS `product_variant_facet_values_facet_value`;
CREATE TABLE IF NOT EXISTS `product_variant_facet_values_facet_value` (
  `productVariantId` int(11) NOT NULL,
  `facetValueId` int(11) NOT NULL,
  PRIMARY KEY (`productVariantId`,`facetValueId`),
  KEY `IDX_69567bc225b6bbbd732d6c5455` (`productVariantId`),
  KEY `IDX_0d641b761ed1dce4ef3cd33d55` (`facetValueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_variant_options_product_option`
--

DROP TABLE IF EXISTS `product_variant_options_product_option`;
CREATE TABLE IF NOT EXISTS `product_variant_options_product_option` (
  `productVariantId` int(11) NOT NULL,
  `productOptionId` int(11) NOT NULL,
  PRIMARY KEY (`productVariantId`,`productOptionId`),
  KEY `IDX_526f0131260eec308a3bd2b61b` (`productVariantId`),
  KEY `IDX_e96a71affe63c97f7fa2f076da` (`productOptionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_variant_price`
--

DROP TABLE IF EXISTS `product_variant_price`;
CREATE TABLE IF NOT EXISTS `product_variant_price` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `price` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channelId` int(11) NOT NULL,
  `variantId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e6126cd268aea6e9b31d89af9ab` (`variantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product_variant_translation`
--

DROP TABLE IF EXISTS `product_variant_translation`;
CREATE TABLE IF NOT EXISTS `product_variant_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `languageCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_420f4d6fb75d38b9dca79bc43b4` (`baseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime DEFAULT NULL,
  `startsAt` datetime DEFAULT NULL,
  `endsAt` datetime DEFAULT NULL,
  `couponCode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perCustomerUsageLimit` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `conditions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `actions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priorityScore` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `promotion_channels_channel`
--

DROP TABLE IF EXISTS `promotion_channels_channel`;
CREATE TABLE IF NOT EXISTS `promotion_channels_channel` (
  `promotionId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`promotionId`,`channelId`),
  KEY `IDX_6d9e2c39ab12391aaa374bcdaa` (`promotionId`),
  KEY `IDX_0eaaf0f4b6c69afde1e88ffb52` (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `refund`
--

DROP TABLE IF EXISTS `refund`;
CREATE TABLE IF NOT EXISTS `refund` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `items` int(11) NOT NULL,
  `shipping` int(11) NOT NULL,
  `adjustment` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transactionId` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1c6932a756108788a361e7d4404` (`paymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reviewproduct`
--

DROP TABLE IF EXISTS `reviewproduct`;
CREATE TABLE IF NOT EXISTS `reviewproduct` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerNameIsPublic` tinyint(4) NOT NULL,
  `stars` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2ab149d14598e9c97620f11c278` (`customerId`),
  KEY `FK_bfbc2613b14d285abc520b6668d` (`productId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `reviewstore`
--

DROP TABLE IF EXISTS `reviewstore`;
CREATE TABLE IF NOT EXISTS `reviewstore` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customerNameIsPublic` tinyint(4) NOT NULL,
  `nps` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `REL_3cf5f0e1ddef2affea08ba6685` (`customerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`createdAt`, `updatedAt`, `code`, `description`, `permissions`, `id`) VALUES
('2021-06-21 16:29:47.232278', '2021-06-21 16:29:47.232278', '__super_admin_role__', 'SuperAdmin', 'Authenticated,SuperAdmin,UpdateGlobalSettings,CreateCatalog,ReadCatalog,UpdateCatalog,DeleteCatalog,CreateSettings,ReadSettings,UpdateSettings,DeleteSettings,CreateAdministrator,ReadAdministrator,UpdateAdministrator,DeleteAdministrator,CreateAsset,ReadAsset,UpdateAsset,DeleteAsset,CreateChannel,ReadChannel,UpdateChannel,DeleteChannel,CreateCollection,ReadCollection,UpdateCollection,DeleteCollection,CreateCountry,ReadCountry,UpdateCountry,DeleteCountry,CreateCustomer,ReadCustomer,UpdateCustomer,DeleteCustomer,CreateCustomerGroup,ReadCustomerGroup,UpdateCustomerGroup,DeleteCustomerGroup,CreateFacet,ReadFacet,UpdateFacet,DeleteFacet,CreateOrder,ReadOrder,UpdateOrder,DeleteOrder,CreatePaymentMethod,ReadPaymentMethod,UpdatePaymentMethod,DeletePaymentMethod,CreateProduct,ReadProduct,UpdateProduct,DeleteProduct,CreatePromotion,ReadPromotion,UpdatePromotion,DeletePromotion,CreateShippingMethod,ReadShippingMethod,UpdateShippingMethod,DeleteShippingMethod,CreateTag,ReadTag,UpdateTag,DeleteTag,CreateTaxCategory,ReadTaxCategory,UpdateTaxCategory,DeleteTaxCategory,CreateTaxRate,ReadTaxRate,UpdateTaxRate,DeleteTaxRate,CreateSystem,ReadSystem,UpdateSystem,DeleteSystem,CreateZone,ReadZone,UpdateZone,DeleteZone', 1),
('2021-06-21 16:29:47.310610', '2021-06-21 16:29:47.310610', '__customer_role__', 'Customer', 'Authenticated', 2);

-- --------------------------------------------------------

--
-- Structure de la table `role_channels_channel`
--

DROP TABLE IF EXISTS `role_channels_channel`;
CREATE TABLE IF NOT EXISTS `role_channels_channel` (
  `roleId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`roleId`,`channelId`),
  KEY `IDX_bfd2a03e9988eda6a9d1176011` (`roleId`),
  KEY `IDX_e09dfee62b158307404202b43a` (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role_channels_channel`
--

INSERT INTO `role_channels_channel` (`roleId`, `channelId`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `search_index_item`
--

DROP TABLE IF EXISTS `search_index_item`;
CREATE TABLE IF NOT EXISTS `search_index_item` (
  `languageCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `productName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productVariantName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `priceWithTax` int(11) NOT NULL,
  `facetIds` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `facetValueIds` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `collectionIds` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `collectionSlugs` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channelIds` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `productPreview` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productPreviewFocalPoint` text COLLATE utf8mb4_unicode_ci,
  `productVariantPreview` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productVariantPreviewFocalPoint` text COLLATE utf8mb4_unicode_ci,
  `productVariantId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `productAssetId` int(11) DEFAULT NULL,
  `productVariantAssetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`languageCode`,`productVariantId`,`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expires` datetime NOT NULL,
  `invalidated` tinyint(4) NOT NULL,
  `authenticationStrategy` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activeOrderId` int(11) DEFAULT NULL,
  `activeChannelId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_232f8e85d7633bd6ddfad42169` (`token`),
  KEY `IDX_e5598363000cab9d9116bd5835` (`type`),
  KEY `FK_7a75399a4f4ffa48ee02e98c059` (`activeOrderId`),
  KEY `FK_eb87ef1e234444728138302263b` (`activeChannelId`),
  KEY `FK_3d2f174ef04fb312fdebd0ddc53` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `session`
--

INSERT INTO `session` (`createdAt`, `updatedAt`, `token`, `expires`, `invalidated`, `authenticationStrategy`, `id`, `activeOrderId`, `activeChannelId`, `type`, `userId`) VALUES
('2021-06-21 16:30:11.692893', '2021-06-21 16:30:11.000000', '017eb7f1b91dedc00a0e024c66c06f9fd3c19dea40ee4443c20698bdbb591285', '2022-06-21 19:30:12', 0, NULL, 1, NULL, 1, 'AnonymousSession', NULL),
('2021-06-21 16:30:23.174583', '2021-06-21 16:30:23.000000', '4f172f2329b7ca2f234b725841110199a1fdf62dc20194a5ec60ad3d55c6c1c0', '2022-06-21 19:30:23', 0, 'native', 2, NULL, 1, 'AuthenticatedSession', 1),
('2021-06-21 16:31:50.547906', '2021-06-21 16:31:50.000000', '80b31598d6d6816883071754fc02210321214dc02704d500b73b0437bb4d33a0', '2022-06-21 19:31:51', 0, NULL, 3, NULL, 1, 'AnonymousSession', NULL),
('2021-06-21 16:32:45.363637', '2021-06-21 16:32:45.000000', 'c9bb3d5fd5438b7e9547131565aac04eab4c39fbb6406b856b32c07a6b500a23', '2022-06-21 19:32:45', 0, 'native', 4, NULL, 1, 'AuthenticatedSession', 2);

-- --------------------------------------------------------

--
-- Structure de la table `shipping_line`
--

DROP TABLE IF EXISTS `shipping_line`;
CREATE TABLE IF NOT EXISTS `shipping_line` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `listPrice` int(11) NOT NULL,
  `listPriceIncludesTax` tinyint(4) NOT NULL,
  `adjustments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxLines` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shippingMethodId` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e2e7642e1e88167c1dfc827fdf3` (`shippingMethodId`),
  KEY `FK_c9f34a440d490d1b66f6829b86c` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `shipping_method`
--

DROP TABLE IF EXISTS `shipping_method`;
CREATE TABLE IF NOT EXISTS `shipping_method` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checker` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `calculator` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulfillmentHandlerCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `shipping_method_channels_channel`
--

DROP TABLE IF EXISTS `shipping_method_channels_channel`;
CREATE TABLE IF NOT EXISTS `shipping_method_channels_channel` (
  `shippingMethodId` int(11) NOT NULL,
  `channelId` int(11) NOT NULL,
  PRIMARY KEY (`shippingMethodId`,`channelId`),
  KEY `IDX_f0a17b94aa5a162f0d422920eb` (`shippingMethodId`),
  KEY `IDX_f2b98dfb56685147bed509acc3` (`channelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `shipping_method_translation`
--

DROP TABLE IF EXISTS `shipping_method_translation`;
CREATE TABLE IF NOT EXISTS `shipping_method_translation` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `languageCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_85ec26c71067ebc84adcd98d1a5` (`baseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `stock_movement`
--

DROP TABLE IF EXISTS `stock_movement`;
CREATE TABLE IF NOT EXISTS `stock_movement` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discriminator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productVariantId` int(11) DEFAULT NULL,
  `orderItemId` int(11) DEFAULT NULL,
  `orderLineId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_94e15d5f12d355d117390131ac` (`discriminator`),
  KEY `FK_e65ba3882557cab4febb54809bb` (`productVariantId`),
  KEY `FK_cbb0990e398bf7713aebdd38482` (`orderItemId`),
  KEY `FK_d2c8d5fca981cc820131f81aa83` (`orderLineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `surcharge`
--

DROP TABLE IF EXISTS `surcharge`;
CREATE TABLE IF NOT EXISTS `surcharge` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `listPrice` int(11) NOT NULL,
  `listPriceIncludesTax` tinyint(4) NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxLines` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL,
  `orderModificationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_154eb685f9b629033bd266df7fa` (`orderId`),
  KEY `FK_a49c5271c39cc8174a0535c8088` (`orderModificationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

DROP TABLE IF EXISTS `tag`;
CREATE TABLE IF NOT EXISTS `tag` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tax_category`
--

DROP TABLE IF EXISTS `tax_category`;
CREATE TABLE IF NOT EXISTS `tax_category` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDefault` tinyint(4) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tax_category`
--

INSERT INTO `tax_category` (`createdAt`, `updatedAt`, `name`, `isDefault`, `id`) VALUES
('2021-06-21 16:31:05.252008', '2021-06-21 16:31:05.252008', 'Taxe zero', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `tax_rate`
--

DROP TABLE IF EXISTS `tax_rate`;
CREATE TABLE IF NOT EXISTS `tax_rate` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(4) NOT NULL,
  `value` decimal(5,2) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) DEFAULT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `customerGroupId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7ee3306d7638aa85ca90d672198` (`categoryId`),
  KEY `FK_9872fc7de2f4e532fd3230d1915` (`zoneId`),
  KEY `FK_8b5ab52fc8887c1a769b9276caf` (`customerGroupId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tax_rate`
--

INSERT INTO `tax_rate` (`createdAt`, `updatedAt`, `name`, `enabled`, `value`, `id`, `categoryId`, `zoneId`, `customerGroupId`) VALUES
('2021-06-21 16:31:17.501957', '2021-06-21 16:31:17.501957', 'taxe 0', 1, '0.00', 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `deletedAt` datetime DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT '0',
  `lastLogin` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `photoId` int(11) DEFAULT NULL,
  `customFields__fix_relational_custom_fields__` tinyint(4) DEFAULT NULL COMMENT 'A work-around needed when only relational custom fields are defined on an entity',
  PRIMARY KEY (`id`),
  KEY `FK_75e2be4ce11d447ef43be0e374f` (`photoId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`createdAt`, `updatedAt`, `deletedAt`, `identifier`, `verified`, `lastLogin`, `id`, `photoId`, `customFields__fix_relational_custom_fields__`) VALUES
('2021-06-21 16:29:48.732623', '2021-06-21 16:30:23.000000', NULL, 'superadmin', 1, '2021-06-21 13:30:23', 1, NULL, NULL),
('2021-06-21 16:32:43.927642', '2021-06-21 16:32:45.000000', NULL, 'Manda@gmail.com', 1, '2021-06-21 13:32:45', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_roles_role`
--

DROP TABLE IF EXISTS `user_roles_role`;
CREATE TABLE IF NOT EXISTS `user_roles_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `IDX_5f9286e6c25594c6b88c108db7` (`userId`),
  KEY `IDX_4be2f7adf862634f5f803d246b` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_roles_role`
--

INSERT INTO `user_roles_role` (`userId`, `roleId`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `zone`
--

DROP TABLE IF EXISTS `zone`;
CREATE TABLE IF NOT EXISTS `zone` (
  `createdAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updatedAt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `zone`
--

INSERT INTO `zone` (`createdAt`, `updatedAt`, `name`, `id`) VALUES
('2021-06-21 16:30:45.068278', '2021-06-21 16:30:45.068278', 'Europe', 1);

-- --------------------------------------------------------

--
-- Structure de la table `zone_members_country`
--

DROP TABLE IF EXISTS `zone_members_country`;
CREATE TABLE IF NOT EXISTS `zone_members_country` (
  `zoneId` int(11) NOT NULL,
  `countryId` int(11) NOT NULL,
  PRIMARY KEY (`zoneId`,`countryId`),
  KEY `IDX_7350d77b6474313fbbaf4b094c` (`zoneId`),
  KEY `IDX_7baeecaf955e54bec73f998b0d` (`countryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `zone_members_country`
--

INSERT INTO `zone_members_country` (`zoneId`, `countryId`) VALUES
(1, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `search_index_item`
--
ALTER TABLE `search_index_item` ADD FULLTEXT KEY `IDX_6fb55742e13e8082954d0436dc` (`productName`);
ALTER TABLE `search_index_item` ADD FULLTEXT KEY `IDX_d8791f444a8bf23fe4c1bc020c` (`productVariantName`);
ALTER TABLE `search_index_item` ADD FULLTEXT KEY `IDX_9a5a6a556f75c4ac7bfdd03410` (`description`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_d87215343c3a3a67e6a0b7f3ea9` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_dc34d382b493ade1f70e834c4d3` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `FK_1966e18ce6a39a82b19204704d7` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `asset_channels_channel`
--
ALTER TABLE `asset_channels_channel`
  ADD CONSTRAINT `FK_16ca9151a5153f1169da5b7b7e3` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_dc4e7435f9f5e9e6436bebd33bb` FOREIGN KEY (`assetId`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `asset_tags_tag`
--
ALTER TABLE `asset_tags_tag`
  ADD CONSTRAINT `FK_9e412b00d4c6cee1a4b3d920716` FOREIGN KEY (`assetId`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_fb5e800171ffbe9823f2cc727fd` FOREIGN KEY (`tagId`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `authentication_method`
--
ALTER TABLE `authentication_method`
  ADD CONSTRAINT `FK_00cbe87bc0d4e36758d61bd31d6` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `channel`
--
ALTER TABLE `channel`
  ADD CONSTRAINT `FK_3140d1ef2973ea15a51c8c33ea7` FOREIGN KEY (`imageCoverId`) REFERENCES `asset` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_afe9f917a1c82b9e9e69f7c6129` FOREIGN KEY (`defaultTaxZoneId`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_c9ca2f58d4517460435cbd8b4c9` FOREIGN KEY (`defaultShippingZoneId`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_d4709364b2fb8a69c6f6e1222ae` FOREIGN KEY (`logoId`) REFERENCES `asset` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `collection`
--
ALTER TABLE `collection`
  ADD CONSTRAINT `FK_4257b61275144db89fa0f5dc059` FOREIGN KEY (`parentId`) REFERENCES `collection` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_7256fef1bb42f1b38156b7449f5` FOREIGN KEY (`featuredAssetId`) REFERENCES `asset` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Contraintes pour la table `collection_asset`
--
ALTER TABLE `collection_asset`
  ADD CONSTRAINT `FK_1ed9e48dfbf74b5fcbb35d3d686` FOREIGN KEY (`collectionId`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_51da53b26522dc0525762d2de8e` FOREIGN KEY (`assetId`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `collection_channels_channel`
--
ALTER TABLE `collection_channels_channel`
  ADD CONSTRAINT `FK_7216ab24077cf5cbece7857dbbd` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_cdbf33ffb5d4519161251520083` FOREIGN KEY (`collectionId`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `collection_product_variants_product_variant`
--
ALTER TABLE `collection_product_variants_product_variant`
  ADD CONSTRAINT `FK_6faa7b72422d9c4679e2f186ad1` FOREIGN KEY (`collectionId`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_fb05887e2867365f236d7dd95ee` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `collection_translation`
--
ALTER TABLE `collection_translation`
  ADD CONSTRAINT `FK_e329f9036210d75caa1d8f2154a` FOREIGN KEY (`baseId`) REFERENCES `collection` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `country_translation`
--
ALTER TABLE `country_translation`
  ADD CONSTRAINT `FK_20958e5bdb4c996c18ca63d18e4` FOREIGN KEY (`baseId`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `FK_3f62b42ed23958b120c235f74df` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_7a9d34477964f14ecac6e9fe037` FOREIGN KEY (`avatarId`) REFERENCES `asset` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `customer_channels_channel`
--
ALTER TABLE `customer_channels_channel`
  ADD CONSTRAINT `FK_a842c9fe8cd4c8ff31402d172d7` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_dc9f69207a8867f83b0fd257e30` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `customer_groups_customer_group`
--
ALTER TABLE `customer_groups_customer_group`
  ADD CONSTRAINT `FK_85feea3f0e5e82133605f78db02` FOREIGN KEY (`customerGroupId`) REFERENCES `customer_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_b823a3c8bf3b78d3ed68736485c` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `facet_channels_channel`
--
ALTER TABLE `facet_channels_channel`
  ADD CONSTRAINT `FK_2a8ea404d05bf682516184db7d3` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ca796020c6d097e251e5d6d2b02` FOREIGN KEY (`facetId`) REFERENCES `facet` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `facet_translation`
--
ALTER TABLE `facet_translation`
  ADD CONSTRAINT `FK_eaea53f44bf9e97790d38a3d68f` FOREIGN KEY (`baseId`) REFERENCES `facet` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `facet_value`
--
ALTER TABLE `facet_value`
  ADD CONSTRAINT `FK_d101dc2265a7341be3d94968c5b` FOREIGN KEY (`facetId`) REFERENCES `facet` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `facet_value_channels_channel`
--
ALTER TABLE `facet_value_channels_channel`
  ADD CONSTRAINT `FK_ad690c1b05596d7f52e52ffeedd` FOREIGN KEY (`facetValueId`) REFERENCES `facet_value` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_e1d54c0b9db3e2eb17faaf5919c` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `facet_value_translation`
--
ALTER TABLE `facet_value_translation`
  ADD CONSTRAINT `FK_3d6e45823b65de808a66cb1423b` FOREIGN KEY (`baseId`) REFERENCES `facet_value` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `FK_543e20855ce2bde06d0acb29b51` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_b8e337759b77baa0a4055d1894e` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `history_entry`
--
ALTER TABLE `history_entry`
  ADD CONSTRAINT `FK_3a05127e67435b4d2332ded7c9e` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_43ac602f839847fdb91101f30ec` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_92f8c334ef06275f9586fd01832` FOREIGN KEY (`administratorId`) REFERENCES `administrator` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_124456e637cca7a415897dce659` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `order_channels_channel`
--
ALTER TABLE `order_channels_channel`
  ADD CONSTRAINT `FK_0d8e5c204480204a60e151e4853` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_d0d16db872499e83b15999f8c7a` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK_3e5161133689fba526377cbccd3` FOREIGN KEY (`refundId`) REFERENCES `refund` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_69384323444206753f0cdeb64e0` FOREIGN KEY (`lineId`) REFERENCES `order_line` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `order_item_fulfillments_fulfillment`
--
ALTER TABLE `order_item_fulfillments_fulfillment`
  ADD CONSTRAINT `FK_8132041a647c28eb27ecc1691fa` FOREIGN KEY (`fulfillmentId`) REFERENCES `fulfillment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_a568a3d5aa7f237edab624960b9` FOREIGN KEY (`orderItemId`) REFERENCES `order_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `order_line`
--
ALTER TABLE `order_line`
  ADD CONSTRAINT `FK_239cfca2a55b98b90b6bef2e44f` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_77be94ce9ec6504466179462275` FOREIGN KEY (`taxCategoryId`) REFERENCES `tax_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_9f065453910ea77d4be8e92618f` FOREIGN KEY (`featuredAssetId`) REFERENCES `asset` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_cbcd22193eda94668e84d33f185` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `order_modification`
--
ALTER TABLE `order_modification`
  ADD CONSTRAINT `FK_1df5bc14a47ef24d2e681f45598` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ad2991fa2933ed8b7f86a716338` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_cb66b63b6e97613013795eadbd5` FOREIGN KEY (`refundId`) REFERENCES `refund` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `order_modification_order_items_order_item`
--
ALTER TABLE `order_modification_order_items_order_item`
  ADD CONSTRAINT `FK_9d631d7bd3d44af50eca535d728` FOREIGN KEY (`orderItemId`) REFERENCES `order_item` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_a48502a38aded69d087a8ec08ad` FOREIGN KEY (`orderModificationId`) REFERENCES `order_modification` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `order_promotions_promotion`
--
ALTER TABLE `order_promotions_promotion`
  ADD CONSTRAINT `FK_2c26b988769c0e3b0120bdef31b` FOREIGN KEY (`promotionId`) REFERENCES `promotion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_67be0e40122ab30a62a9817efe0` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `FK_d09d285fe1645cd2f0db811e293` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `payment_method_channels_channel`
--
ALTER TABLE `payment_method_channels_channel`
  ADD CONSTRAINT `FK_5bcb569635ce5407eb3f264487d` FOREIGN KEY (`paymentMethodId`) REFERENCES `payment_method` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_c00e36f667d35031087b382e61b` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_91a19e6613534949a4ce6e76ff8` FOREIGN KEY (`featuredAssetId`) REFERENCES `asset` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_asset`
--
ALTER TABLE `product_asset`
  ADD CONSTRAINT `FK_0d1294f5c22a56da7845ebab72c` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_5888ac17b317b93378494a10620` FOREIGN KEY (`assetId`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_channels_channel`
--
ALTER TABLE `product_channels_channel`
  ADD CONSTRAINT `FK_26d12be3b5fec6c4adb1d792844` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_a51dfbd87c330c075c39832b6e7` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_facet_values_facet_value`
--
ALTER TABLE `product_facet_values_facet_value`
  ADD CONSTRAINT `FK_06e7d73673ee630e8ec50d0b29f` FOREIGN KEY (`facetValueId`) REFERENCES `facet_value` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_6a0558e650d75ae639ff38e413a` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_option`
--
ALTER TABLE `product_option`
  ADD CONSTRAINT `FK_a6debf9198e2fbfa006aa10d710` FOREIGN KEY (`groupId`) REFERENCES `product_option_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_option_group`
--
ALTER TABLE `product_option_group`
  ADD CONSTRAINT `FK_a6e91739227bf4d442f23c52c75` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_option_group_translation`
--
ALTER TABLE `product_option_group_translation`
  ADD CONSTRAINT `FK_93751abc1451972c02e033b766c` FOREIGN KEY (`baseId`) REFERENCES `product_option_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_option_translation`
--
ALTER TABLE `product_option_translation`
  ADD CONSTRAINT `FK_a79a443c1f7841f3851767faa6d` FOREIGN KEY (`baseId`) REFERENCES `product_option` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_recommendation`
--
ALTER TABLE `product_recommendation`
  ADD CONSTRAINT `FK_0e5b7189b01aeb4fe80d0e959e2` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_dbc55f2536f73447d607ef03a2f` FOREIGN KEY (`recommendationId`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_translation`
--
ALTER TABLE `product_translation`
  ADD CONSTRAINT `FK_7dbc75cb4e8b002620c4dbfdac5` FOREIGN KEY (`baseId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_variant`
--
ALTER TABLE `product_variant`
  ADD CONSTRAINT `FK_0e6f516053cf982b537836e21cf` FOREIGN KEY (`featuredAssetId`) REFERENCES `asset` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_6e420052844edf3a5506d863ce6` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_e38dca0d82fd64c7cf8aac8b8ef` FOREIGN KEY (`taxCategoryId`) REFERENCES `tax_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_variant_asset`
--
ALTER TABLE `product_variant_asset`
  ADD CONSTRAINT `FK_10b5a2e3dee0e30b1e26c32f5c7` FOREIGN KEY (`assetId`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_fa21412afac15a2304f3eb35feb` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_variant_channels_channel`
--
ALTER TABLE `product_variant_channels_channel`
  ADD CONSTRAINT `FK_beeb2b3cd800e589f2213ae99d6` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_d194bff171b62357688a5d0f559` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_variant_facet_values_facet_value`
--
ALTER TABLE `product_variant_facet_values_facet_value`
  ADD CONSTRAINT `FK_0d641b761ed1dce4ef3cd33d559` FOREIGN KEY (`facetValueId`) REFERENCES `facet_value` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_69567bc225b6bbbd732d6c5455b` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_variant_options_product_option`
--
ALTER TABLE `product_variant_options_product_option`
  ADD CONSTRAINT `FK_526f0131260eec308a3bd2b61b6` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_e96a71affe63c97f7fa2f076dac` FOREIGN KEY (`productOptionId`) REFERENCES `product_option` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_variant_price`
--
ALTER TABLE `product_variant_price`
  ADD CONSTRAINT `FK_e6126cd268aea6e9b31d89af9ab` FOREIGN KEY (`variantId`) REFERENCES `product_variant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `product_variant_translation`
--
ALTER TABLE `product_variant_translation`
  ADD CONSTRAINT `FK_420f4d6fb75d38b9dca79bc43b4` FOREIGN KEY (`baseId`) REFERENCES `product_variant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `promotion_channels_channel`
--
ALTER TABLE `promotion_channels_channel`
  ADD CONSTRAINT `FK_0eaaf0f4b6c69afde1e88ffb52d` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_6d9e2c39ab12391aaa374bcdaa4` FOREIGN KEY (`promotionId`) REFERENCES `promotion` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `refund`
--
ALTER TABLE `refund`
  ADD CONSTRAINT `FK_1c6932a756108788a361e7d4404` FOREIGN KEY (`paymentId`) REFERENCES `payment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reviewproduct`
--
ALTER TABLE `reviewproduct`
  ADD CONSTRAINT `FK_2ab149d14598e9c97620f11c278` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_bfbc2613b14d285abc520b6668d` FOREIGN KEY (`productId`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `reviewstore`
--
ALTER TABLE `reviewstore`
  ADD CONSTRAINT `FK_3cf5f0e1ddef2affea08ba66858` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `role_channels_channel`
--
ALTER TABLE `role_channels_channel`
  ADD CONSTRAINT `FK_bfd2a03e9988eda6a9d11760119` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_e09dfee62b158307404202b43a5` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `FK_3d2f174ef04fb312fdebd0ddc53` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_7a75399a4f4ffa48ee02e98c059` FOREIGN KEY (`activeOrderId`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_eb87ef1e234444728138302263b` FOREIGN KEY (`activeChannelId`) REFERENCES `channel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `shipping_line`
--
ALTER TABLE `shipping_line`
  ADD CONSTRAINT `FK_c9f34a440d490d1b66f6829b86c` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_e2e7642e1e88167c1dfc827fdf3` FOREIGN KEY (`shippingMethodId`) REFERENCES `shipping_method` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `shipping_method_channels_channel`
--
ALTER TABLE `shipping_method_channels_channel`
  ADD CONSTRAINT `FK_f0a17b94aa5a162f0d422920eb2` FOREIGN KEY (`shippingMethodId`) REFERENCES `shipping_method` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_f2b98dfb56685147bed509acc3d` FOREIGN KEY (`channelId`) REFERENCES `channel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `shipping_method_translation`
--
ALTER TABLE `shipping_method_translation`
  ADD CONSTRAINT `FK_85ec26c71067ebc84adcd98d1a5` FOREIGN KEY (`baseId`) REFERENCES `shipping_method` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stock_movement`
--
ALTER TABLE `stock_movement`
  ADD CONSTRAINT `FK_cbb0990e398bf7713aebdd38482` FOREIGN KEY (`orderItemId`) REFERENCES `order_item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_d2c8d5fca981cc820131f81aa83` FOREIGN KEY (`orderLineId`) REFERENCES `order_line` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_e65ba3882557cab4febb54809bb` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `surcharge`
--
ALTER TABLE `surcharge`
  ADD CONSTRAINT `FK_154eb685f9b629033bd266df7fa` FOREIGN KEY (`orderId`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_a49c5271c39cc8174a0535c8088` FOREIGN KEY (`orderModificationId`) REFERENCES `order_modification` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tax_rate`
--
ALTER TABLE `tax_rate`
  ADD CONSTRAINT `FK_7ee3306d7638aa85ca90d672198` FOREIGN KEY (`categoryId`) REFERENCES `tax_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_8b5ab52fc8887c1a769b9276caf` FOREIGN KEY (`customerGroupId`) REFERENCES `customer_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_9872fc7de2f4e532fd3230d1915` FOREIGN KEY (`zoneId`) REFERENCES `zone` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_75e2be4ce11d447ef43be0e374f` FOREIGN KEY (`photoId`) REFERENCES `asset` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `user_roles_role`
--
ALTER TABLE `user_roles_role`
  ADD CONSTRAINT `FK_4be2f7adf862634f5f803d246b8` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_5f9286e6c25594c6b88c108db77` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Contraintes pour la table `zone_members_country`
--
ALTER TABLE `zone_members_country`
  ADD CONSTRAINT `FK_7350d77b6474313fbbaf4b094c1` FOREIGN KEY (`zoneId`) REFERENCES `zone` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_7baeecaf955e54bec73f998b0d5` FOREIGN KEY (`countryId`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
