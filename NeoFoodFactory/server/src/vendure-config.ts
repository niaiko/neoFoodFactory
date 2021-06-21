import {
    Address,
    Asset,
    DefaultJobQueuePlugin,
    DefaultLogger,
    defaultPromotionActions,
    DefaultSearchPlugin,
    dummyPaymentHandler,
    examplePaymentHandler,
    FulfillmentHandler,
    LanguageCode,
    LogLevel,
    manualFulfillmentHandler,
    PaymentMethodEligibilityChecker,
    PromotionItemAction,
    VendureConfig,
} from '@vendure/core';
import { ADMIN_API_PATH, API_PORT, SHOP_API_PATH } from '@vendure/common/lib/shared-constants';
import { defaultEmailHandlers, EmailPlugin } from '@vendure/email-plugin';
import { AssetServerPlugin } from '@vendure/asset-server-plugin';
import { AdminUiPlugin } from '@vendure/admin-ui-plugin';
import { ElasticsearchPlugin } from '@vendure/elasticsearch-plugin';
import { ReviewsStorePlugin, ReviewsProductPlugin } from 'vendure-reviews-plugin';
import { FavoritesPlugin } from "vendure-favorites-plugin";
import { ProductRecommendationsInputModule, ProductRecommendationsPlugin } from "vendure-product-recommendations";
import { ConnectionOptions } from 'typeorm';
import { compileUiExtensions } from '@vendure/ui-devkit/compiler';
import path from 'path';

const testPaymentChecker = new PaymentMethodEligibilityChecker({
    code: 'test-checker',
    description: [{ languageCode: LanguageCode.en, value: 'test checker' }],
    args: {},
    check: (ctx, order) => true,
});

const testPromoAction = new PromotionItemAction({
    code: 'discount-price-action',
    description: [{ languageCode: LanguageCode.en, value: 'Apply discount price' }],
    args: {},
    execute: (ctx, orderItem, orderLine) => {
        if ((orderLine.productVariant.customFields as any).discountPrice) {
            return -(
                orderLine.unitPriceWithTax - (orderLine.productVariant.customFields as any).discountPrice
            );
        }
        return 0;
    },
});

const myHandler = new FulfillmentHandler({
    code: 'test-handler',
    args: {},
    description: [{ languageCode: LanguageCode.en, value: 'test fulfillment handler' }],
    createFulfillment: ctx => {
        return {
            method: 'test-handler',
            trackingCode: '123123123123',
            customFields: {
                logoId: 1,
            },
        };
    },
});

/**
 * Config settings used during development
 */

export const config: VendureConfig = {
   
    apiOptions: {
        /**
        * A decommenter si prod 'hostname'
        */
        // hostname: 'https://neofood.mangoosta.eu',
        port: 3000,
        adminApiPath: 'admin-api',
        adminApiPlayground: {
            settings: {
                'request.credentials': 'include',
            } as any,
        },// turn this off for production
        adminApiDebug: true, // turn this off for production
        shopApiPath: 'shop-api',
        shopApiPlayground: {
            settings: {
                'request.credentials': 'include',
            } as any,
        },// turn this off for production
        shopApiDebug: true,// turn this off for production
    },
    authOptions: {
        disableAuth: false,
        // tokenMethod: 'cookie',
        tokenMethod: 'bearer',
        requireVerification: false,
        customPermissions: [],
        authTokenHeaderKey: 'vendure-auth-token',
        sessionDuration: '1y',
        superadminCredentials: {
            identifier: 'superadmin',
            password: 'superadmin',
        },
    },
    dbConnectionOptions: {
        type: 'mysql',
        synchronize: true, // turn this off for production
        charset: 'utf8mb4_unicode_ci',
        logging: false,
        database: 'neofood2',
        host: 'localhost',
        port: 3306,
        username: 'root',
        password: '',
        migrations: [path.join(__dirname, '../migrations/*.ts')],
    },
    paymentOptions: {
        paymentMethodEligibilityCheckers: [testPaymentChecker],
        paymentMethodHandlers: [dummyPaymentHandler],
    },
    promotionOptions: {
        promotionActions: [...defaultPromotionActions, testPromoAction],
    },
    customFields: {
        /*Asset: [{ name: 'description', type: 'string' }],*/
        ProductVariant: [{ name: 'discountPrice', type: 'int' }],
        Channel: [
            // {name: 'adresse', type: 'relation', entity: Address, graphQLType: 'Address', eager: false},
            { name: 'adressChannel', type: 'string' },
            { name: 'emailAdress', type: 'string' },
            { name: 'telephone', type: 'int' },
            { name: 'ouvertureMagasin', type: 'string', list: true },
            { name: 'ouvertureService', type: 'string', list: true },
            { name: 'logo', type: 'relation', entity: Asset, graphQLType: 'Asset', eager: false },
            { name: 'imageCover', type: 'relation', entity: Asset, graphQLType: 'Asset', eager: false },
        ],
        Customer: [{ name: 'avatar', type: 'relation', graphQLType: 'Asset', entity: Asset, eager: false }],
        User: [{ name: 'photo', type: 'relation', graphQLType: 'Asset', entity: Asset, eager: false }],
        Address: [{ name: 'long', type: 'float' },
        { name: 'lat', type: 'float' },
        { name: 'pays', type: 'string' },
        { name: 'fullAddress', type: 'string' }
        ]
    },
    logger: new DefaultLogger({ level: LogLevel.Info }),
    importExportOptions: {
        importAssetsDir: path.join(__dirname, 'import-assets'),
    },
    shippingOptions: {
        fulfillmentHandlers: [manualFulfillmentHandler, myHandler],
    },
    plugins: [
        AssetServerPlugin.init({
            route: 'assets',
            assetUploadDir: path.join(__dirname, '../static/assets'),
        }),
        DefaultJobQueuePlugin,
        DefaultSearchPlugin,
        EmailPlugin.init({
            devMode: true,
            outputPath: path.join(__dirname, '../static/email/test-emails'),
            route: 'mailbox',
            handlers: defaultEmailHandlers,
            templatePath: path.join(__dirname, '../static/email/templates'),
            globalTemplateVars: {
                // The following variables will change depending on your storefront implementation
                fromAddress: '"example" <noreply@example.com>',
                verifyEmailAddressUrl: 'http://localhost:4242/verify',
                passwordResetUrl: 'http://localhost:4242/password-reset',
                changeEmailAddressUrl: 'http://localhost:4242/verify-email-address-change'
            },
        }),
        ReviewsStorePlugin,
        ReviewsProductPlugin,
        FavoritesPlugin,
        ProductRecommendationsPlugin,
        AdminUiPlugin.init({
            route: 'admin',
            port: 3002,
        }),
    ],
};
