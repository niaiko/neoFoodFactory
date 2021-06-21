// import { Args, Mutation, Resolver, ResolveField } from '@nestjs/graphql';
// import gql from 'graphql-tag';
// import { Ctx, PluginCommonModule, ProductService, AssetService, RequestContext, VendureConfig, VendurePlugin, Transaction } from '@vendure/core';
// import { MutationCreateAssetsArgs, CreateAssetResult } from '@vendure/common/lib/generated-types';
// const schemaExtension = gql`
//     type MimeTypeError implements ErrorResult {
//       errorCode: ErrorCode!
//       message: String!
//       fileName: String!
//       mimeType: String!
//     }
//     union CreateAssetResult = Asset | MimeTypeError
//     input CreateAssetInput {
//       file: Upload!
//       tags: [String!]
//     }
//     extend type Mutation {
//       createAvatarAsset(input: [CreateAssetInput!]!): [CreateAssetResult!]!
//     }
// `;
// @Resolver()
// export class CreateAvatarAssetResolver {
//     constructor(private assetService: AssetService) { }
//     @Transaction()
//     @Mutation()
//     async createAvatarAsset(
//         @Ctx() ctx: RequestContext,
//         @Args() args: MutationCreateAssetsArgs,
//     ): Promise<CreateAssetResult[]> {
//         const assets: CreateAssetResult[] = [];
//         for (const input of args.input) {
//             const asset = await this.assetService.create(ctx, input);
//             assets.push(asset);
//         }
//         return assets;
//     }
// }

// @Resolver('CreateAssetResult')
// export class CreateAssetResultResolver {
//     __resolveType(value: any): string {
//         console.log(value);
//         return 'Asset';
//     }
// }

// @ResolveField()

// @VendurePlugin({
//     imports: [PluginCommonModule],
//     shopApiExtensions: {
//         schema: schemaExtension,
//         resolvers: [CreateAvatarAssetResolver],
//     },
//     configuration: config => {
//         return config;
//     }
// })
// export class AvatarAsset { }