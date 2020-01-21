//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct OrderProductInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(product: String, variant: Swift.Optional<String?> = nil, quantity: Int) {
    graphQLMap = ["product": product, "variant": variant, "quantity": quantity]
  }

  public var product: String {
    get {
      return graphQLMap["product"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "product")
    }
  }

  public var variant: Swift.Optional<String?> {
    get {
      return graphQLMap["variant"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "variant")
    }
  }

  public var quantity: Int {
    get {
      return graphQLMap["quantity"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "quantity")
    }
  }
}

/// Status should be method of payment
public enum PaymentMethod: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case cod
  case bkash
  case masterCard
  case sslcommerz
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "COD": self = .cod
      case "BKASH": self = .bkash
      case "MASTER_CARD": self = .masterCard
      case "SSLCOMMERZ": self = .sslcommerz
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .cod: return "COD"
      case .bkash: return "BKASH"
      case .masterCard: return "MASTER_CARD"
      case .sslcommerz: return "SSLCOMMERZ"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: PaymentMethod, rhs: PaymentMethod) -> Bool {
    switch (lhs, rhs) {
      case (.cod, .cod): return true
      case (.bkash, .bkash): return true
      case (.masterCard, .masterCard): return true
      case (.sslcommerz, .sslcommerz): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [PaymentMethod] {
    return [
      .cod,
      .bkash,
      .masterCard,
      .sslcommerz,
    ]
  }
}

/// This is used for status
public enum OrderStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case completed
  case shipping
  case pending
  case progressing
  case refund
  case cancelled
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "COMPLETED": self = .completed
      case "SHIPPING": self = .shipping
      case "PENDING": self = .pending
      case "PROGRESSING": self = .progressing
      case "REFUND": self = .refund
      case "CANCELLED": self = .cancelled
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .completed: return "COMPLETED"
      case .shipping: return "SHIPPING"
      case .pending: return "PENDING"
      case .progressing: return "PROGRESSING"
      case .refund: return "REFUND"
      case .cancelled: return "CANCELLED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: OrderStatus, rhs: OrderStatus) -> Bool {
    switch (lhs, rhs) {
      case (.completed, .completed): return true
      case (.shipping, .shipping): return true
      case (.pending, .pending): return true
      case (.progressing, .progressing): return true
      case (.refund, .refund): return true
      case (.cancelled, .cancelled): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [OrderStatus] {
    return [
      .completed,
      .shipping,
      .pending,
      .progressing,
      .refund,
      .cancelled,
    ]
  }
}

/// This is used for discount type
public enum DiscountType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case percentage
  case flat
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "PERCENTAGE": self = .percentage
      case "FLAT": self = .flat
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .percentage: return "PERCENTAGE"
      case .flat: return "FLAT"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: DiscountType, rhs: DiscountType) -> Bool {
    switch (lhs, rhs) {
      case (.percentage, .percentage): return true
      case (.flat, .flat): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [DiscountType] {
    return [
      .percentage,
      .flat,
    ]
  }
}

public final class GetProductListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query GetProductList($page: Int!, $limit: Int!) {
      products(pagination: {page: $page, limit: $limit}) {
        __typename
        docs {
          __typename
          ...getProduct
        }
      }
    }
    """

  public let operationName = "GetProductList"

  public var queryDocument: String { return operationDefinition.appending(GetProduct.fragmentDefinition).appending(GetShop.fragmentDefinition).appending(GetShippinginfo.fragmentDefinition).appending(GetVariantOption.fragmentDefinition).appending(GetRating.fragmentDefinition).appending(GetRatingCount.fragmentDefinition) }

  public var page: Int
  public var limit: Int

  public init(page: Int, limit: Int) {
    self.page = page
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["page": page, "limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("products", arguments: ["pagination": ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")]], type: .nonNull(.object(Product.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(products: Product) {
      self.init(unsafeResultMap: ["__typename": "Query", "products": products.resultMap])
    }

    public var products: Product {
      get {
        return Product(unsafeResultMap: resultMap["products"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "products")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes = ["ProductPaginateModel"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("docs", type: .nonNull(.list(.nonNull(.object(Doc.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(docs: [Doc]) {
        self.init(unsafeResultMap: ["__typename": "ProductPaginateModel", "docs": docs.map { (value: Doc) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var docs: [Doc] {
        get {
          return (resultMap["docs"] as! [ResultMap]).map { (value: ResultMap) -> Doc in Doc(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Doc) -> ResultMap in value.resultMap }, forKey: "docs")
        }
      }

      public struct Doc: GraphQLSelectionSet {
        public static let possibleTypes = ["Product"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(GetProduct.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var getProduct: GetProduct {
            get {
              return GetProduct(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class GetProductQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query GetProduct($_id: ObjectId!) {
      product(_id: $_id) {
        __typename
        ...getProduct
      }
    }
    """

  public let operationName = "GetProduct"

  public var queryDocument: String { return operationDefinition.appending(GetProduct.fragmentDefinition).appending(GetShop.fragmentDefinition).appending(GetShippinginfo.fragmentDefinition).appending(GetVariantOption.fragmentDefinition).appending(GetRating.fragmentDefinition).appending(GetRatingCount.fragmentDefinition) }

  public var _id: String

  public init(_id: String) {
    self._id = _id
  }

  public var variables: GraphQLMap? {
    return ["_id": _id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("product", arguments: ["_id": GraphQLVariable("_id")], type: .nonNull(.object(Product.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(product: Product) {
      self.init(unsafeResultMap: ["__typename": "Query", "product": product.resultMap])
    }

    public var product: Product {
      get {
        return Product(unsafeResultMap: resultMap["product"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "product")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes = ["Product"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(GetProduct.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var getProduct: GetProduct {
          get {
            return GetProduct(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetProductsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query GetProducts($ids: [ObjectId!]) {
      productsByMultipleId(data: {ids: $ids}) {
        __typename
        _id
        thumnails {
          __typename
          image
        }
        name
        price
      }
    }
    """

  public let operationName = "GetProducts"

  public var ids: [String]?

  public init(ids: [String]?) {
    self.ids = ids
  }

  public var variables: GraphQLMap? {
    return ["ids": ids]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("productsByMultipleId", arguments: ["data": ["ids": GraphQLVariable("ids")]], type: .nonNull(.list(.nonNull(.object(ProductsByMultipleId.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(productsByMultipleId: [ProductsByMultipleId]) {
      self.init(unsafeResultMap: ["__typename": "Query", "productsByMultipleId": productsByMultipleId.map { (value: ProductsByMultipleId) -> ResultMap in value.resultMap }])
    }

    public var productsByMultipleId: [ProductsByMultipleId] {
      get {
        return (resultMap["productsByMultipleId"] as! [ResultMap]).map { (value: ResultMap) -> ProductsByMultipleId in ProductsByMultipleId(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: ProductsByMultipleId) -> ResultMap in value.resultMap }, forKey: "productsByMultipleId")
      }
    }

    public struct ProductsByMultipleId: GraphQLSelectionSet {
      public static let possibleTypes = ["Product"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("_id", type: .nonNull(.scalar(String.self))),
        GraphQLField("thumnails", type: .list(.nonNull(.object(Thumnail.selections)))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("price", type: .nonNull(.scalar(Double.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: String, thumnails: [Thumnail]? = nil, name: String, price: Double) {
        self.init(unsafeResultMap: ["__typename": "Product", "_id": _id, "thumnails": thumnails.flatMap { (value: [Thumnail]) -> [ResultMap] in value.map { (value: Thumnail) -> ResultMap in value.resultMap } }, "name": name, "price": price])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var _id: String {
        get {
          return resultMap["_id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "_id")
        }
      }

      /// For thumbnails images
      public var thumnails: [Thumnail]? {
        get {
          return (resultMap["thumnails"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Thumnail] in value.map { (value: ResultMap) -> Thumnail in Thumnail(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Thumnail]) -> [ResultMap] in value.map { (value: Thumnail) -> ResultMap in value.resultMap } }, forKey: "thumnails")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var price: Double {
        get {
          return resultMap["price"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "price")
        }
      }

      public struct Thumnail: GraphQLSelectionSet {
        public static let possibleTypes = ["Image"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("image", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "image": image])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }
      }
    }
  }
}

public final class ProductsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query Products($_id: ObjectId!, $page: Int!, $limit: Int!) {
      products(filter: {categoryId: $_id}, sort: {}, query: {}, pagination: {page: $page, limit: $limit}) {
        __typename
        docs {
          __typename
          ...getProduct
        }
      }
    }
    """

  public let operationName = "Products"

  public var queryDocument: String { return operationDefinition.appending(GetProduct.fragmentDefinition).appending(GetShop.fragmentDefinition).appending(GetShippinginfo.fragmentDefinition).appending(GetVariantOption.fragmentDefinition).appending(GetRating.fragmentDefinition).appending(GetRatingCount.fragmentDefinition) }

  public var _id: String
  public var page: Int
  public var limit: Int

  public init(_id: String, page: Int, limit: Int) {
    self._id = _id
    self.page = page
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["_id": _id, "page": page, "limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("products", arguments: ["filter": ["categoryId": GraphQLVariable("_id")], "sort": [:], "query": [:], "pagination": ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")]], type: .nonNull(.object(Product.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(products: Product) {
      self.init(unsafeResultMap: ["__typename": "Query", "products": products.resultMap])
    }

    public var products: Product {
      get {
        return Product(unsafeResultMap: resultMap["products"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "products")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes = ["ProductPaginateModel"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("docs", type: .nonNull(.list(.nonNull(.object(Doc.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(docs: [Doc]) {
        self.init(unsafeResultMap: ["__typename": "ProductPaginateModel", "docs": docs.map { (value: Doc) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var docs: [Doc] {
        get {
          return (resultMap["docs"] as! [ResultMap]).map { (value: ResultMap) -> Doc in Doc(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Doc) -> ResultMap in value.resultMap }, forKey: "docs")
        }
      }

      public struct Doc: GraphQLSelectionSet {
        public static let possibleTypes = ["Product"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(GetProduct.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var getProduct: GetProduct {
            get {
              return GetProduct(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class ProductsBySellerQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query productsBySeller($_id: ObjectId!, $page: Int!, $limit: Int!) {
      products(filter: {shop: $_id}, sort: {}, query: {}, pagination: {page: $page, limit: $limit}) {
        __typename
        docs {
          __typename
          ...getProduct
        }
      }
    }
    """

  public let operationName = "productsBySeller"

  public var queryDocument: String { return operationDefinition.appending(GetProduct.fragmentDefinition).appending(GetShop.fragmentDefinition).appending(GetShippinginfo.fragmentDefinition).appending(GetVariantOption.fragmentDefinition).appending(GetRating.fragmentDefinition).appending(GetRatingCount.fragmentDefinition) }

  public var _id: String
  public var page: Int
  public var limit: Int

  public init(_id: String, page: Int, limit: Int) {
    self._id = _id
    self.page = page
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["_id": _id, "page": page, "limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("products", arguments: ["filter": ["shop": GraphQLVariable("_id")], "sort": [:], "query": [:], "pagination": ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")]], type: .nonNull(.object(Product.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(products: Product) {
      self.init(unsafeResultMap: ["__typename": "Query", "products": products.resultMap])
    }

    public var products: Product {
      get {
        return Product(unsafeResultMap: resultMap["products"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "products")
      }
    }

    public struct Product: GraphQLSelectionSet {
      public static let possibleTypes = ["ProductPaginateModel"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("docs", type: .nonNull(.list(.nonNull(.object(Doc.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(docs: [Doc]) {
        self.init(unsafeResultMap: ["__typename": "ProductPaginateModel", "docs": docs.map { (value: Doc) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var docs: [Doc] {
        get {
          return (resultMap["docs"] as! [ResultMap]).map { (value: ResultMap) -> Doc in Doc(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Doc) -> ResultMap in value.resultMap }, forKey: "docs")
        }
      }

      public struct Doc: GraphQLSelectionSet {
        public static let possibleTypes = ["Product"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(GetProduct.self),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var getProduct: GetProduct {
            get {
              return GetProduct(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class SetOderMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation setOder($shippingDetailsId: ObjectId!, $billingDetailsId: ObjectId!, $product: [OrderProductInput!]!, $paymentmethod: PaymentMethod!, $ordernote: String!) {
      createOrder(data: {shippingDetailsId: $shippingDetailsId, billingDetailsId: $billingDetailsId, products: $product, paymentMethod: $paymentmethod, orderNote: $ordernote}) {
        __typename
        ...getOrder
      }
    }
    """

  public let operationName = "setOder"

  public var queryDocument: String { return operationDefinition.appending(GetOrder.fragmentDefinition) }

  public var shippingDetailsId: String
  public var billingDetailsId: String
  public var product: [OrderProductInput]
  public var paymentmethod: PaymentMethod
  public var ordernote: String

  public init(shippingDetailsId: String, billingDetailsId: String, product: [OrderProductInput], paymentmethod: PaymentMethod, ordernote: String) {
    self.shippingDetailsId = shippingDetailsId
    self.billingDetailsId = billingDetailsId
    self.product = product
    self.paymentmethod = paymentmethod
    self.ordernote = ordernote
  }

  public var variables: GraphQLMap? {
    return ["shippingDetailsId": shippingDetailsId, "billingDetailsId": billingDetailsId, "product": product, "paymentmethod": paymentmethod, "ordernote": ordernote]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createOrder", arguments: ["data": ["shippingDetailsId": GraphQLVariable("shippingDetailsId"), "billingDetailsId": GraphQLVariable("billingDetailsId"), "products": GraphQLVariable("product"), "paymentMethod": GraphQLVariable("paymentmethod"), "orderNote": GraphQLVariable("ordernote")]], type: .nonNull(.object(CreateOrder.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createOrder: CreateOrder) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createOrder": createOrder.resultMap])
    }

    public var createOrder: CreateOrder {
      get {
        return CreateOrder(unsafeResultMap: resultMap["createOrder"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createOrder")
      }
    }

    public struct CreateOrder: GraphQLSelectionSet {
      public static let possibleTypes = ["Order"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(GetOrder.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: String, trxId: String? = nil, total: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "Order", "_id": _id, "trxId": trxId, "total": total])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var getOrder: GetOrder {
          get {
            return GetOrder(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetCategoriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query getCategories($page: Int!, $limit: Int!) {
      categories(pagination: {page: $page, limit: $limit}) {
        __typename
        docs {
          __typename
          ...getCategory
          child {
            __typename
            ...getCategory
          }
        }
      }
    }
    """

  public let operationName = "getCategories"

  public var queryDocument: String { return operationDefinition.appending(GetCategory.fragmentDefinition) }

  public var page: Int
  public var limit: Int

  public init(page: Int, limit: Int) {
    self.page = page
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["page": page, "limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("categories", arguments: ["pagination": ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")]], type: .nonNull(.object(Category.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(categories: Category) {
      self.init(unsafeResultMap: ["__typename": "Query", "categories": categories.resultMap])
    }

    public var categories: Category {
      get {
        return Category(unsafeResultMap: resultMap["categories"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "categories")
      }
    }

    public struct Category: GraphQLSelectionSet {
      public static let possibleTypes = ["CategoryPaginateModel"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("docs", type: .nonNull(.list(.nonNull(.object(Doc.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(docs: [Doc]) {
        self.init(unsafeResultMap: ["__typename": "CategoryPaginateModel", "docs": docs.map { (value: Doc) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var docs: [Doc] {
        get {
          return (resultMap["docs"] as! [ResultMap]).map { (value: ResultMap) -> Doc in Doc(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Doc) -> ResultMap in value.resultMap }, forKey: "docs")
        }
      }

      public struct Doc: GraphQLSelectionSet {
        public static let possibleTypes = ["Category"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(GetCategory.self),
          GraphQLField("child", type: .list(.nonNull(.object(Child.selections)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var child: [Child]? {
          get {
            return (resultMap["child"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Child] in value.map { (value: ResultMap) -> Child in Child(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Child]) -> [ResultMap] in value.map { (value: Child) -> ResultMap in value.resultMap } }, forKey: "child")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var getCategory: GetCategory {
            get {
              return GetCategory(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }

        public struct Child: GraphQLSelectionSet {
          public static let possibleTypes = ["Category"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(GetCategory.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(_id: String? = nil, name: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Category", "_id": _id, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var getCategory: GetCategory {
              get {
                return GetCategory(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public final class GetOrderQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query getOrder($_id: ObjectId!, $page: Int!, $limit: Int!) {
      orders(query: {orderedBy: $_id}, pagination: {page: $page, limit: $limit}) {
        __typename
        docs {
          __typename
          _id
          shippingDetails {
            __typename
            ...getAddress
          }
          billingDetails {
            __typename
            ...getAddress
          }
          products {
            __typename
            product {
              __typename
              ...getProduct
            }
            quantity
          }
          status
          subTotal
          discount
          shipping
          total
          createdAt
          paymentMethod
        }
      }
    }
    """

  public let operationName = "getOrder"

  public var queryDocument: String { return operationDefinition.appending(GetAddress.fragmentDefinition).appending(GetProduct.fragmentDefinition).appending(GetShop.fragmentDefinition).appending(GetShippinginfo.fragmentDefinition).appending(GetVariantOption.fragmentDefinition).appending(GetRating.fragmentDefinition).appending(GetRatingCount.fragmentDefinition) }

  public var _id: String
  public var page: Int
  public var limit: Int

  public init(_id: String, page: Int, limit: Int) {
    self._id = _id
    self.page = page
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["_id": _id, "page": page, "limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("orders", arguments: ["query": ["orderedBy": GraphQLVariable("_id")], "pagination": ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")]], type: .nonNull(.object(Order.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(orders: Order) {
      self.init(unsafeResultMap: ["__typename": "Query", "orders": orders.resultMap])
    }

    public var orders: Order {
      get {
        return Order(unsafeResultMap: resultMap["orders"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "orders")
      }
    }

    public struct Order: GraphQLSelectionSet {
      public static let possibleTypes = ["OrderPaginateModel"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("docs", type: .nonNull(.list(.nonNull(.object(Doc.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(docs: [Doc]) {
        self.init(unsafeResultMap: ["__typename": "OrderPaginateModel", "docs": docs.map { (value: Doc) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var docs: [Doc] {
        get {
          return (resultMap["docs"] as! [ResultMap]).map { (value: ResultMap) -> Doc in Doc(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Doc) -> ResultMap in value.resultMap }, forKey: "docs")
        }
      }

      public struct Doc: GraphQLSelectionSet {
        public static let possibleTypes = ["Order"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("shippingDetails", type: .object(ShippingDetail.selections)),
          GraphQLField("billingDetails", type: .object(BillingDetail.selections)),
          GraphQLField("products", type: .list(.nonNull(.object(Product.selections)))),
          GraphQLField("status", type: .scalar(OrderStatus.self)),
          GraphQLField("subTotal", type: .nonNull(.scalar(Double.self))),
          GraphQLField("discount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("shipping", type: .scalar(Double.self)),
          GraphQLField("total", type: .scalar(Double.self)),
          GraphQLField("createdAt", type: .scalar(String.self)),
          GraphQLField("paymentMethod", type: .nonNull(.scalar(PaymentMethod.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(_id: String, shippingDetails: ShippingDetail? = nil, billingDetails: BillingDetail? = nil, products: [Product]? = nil, status: OrderStatus? = nil, subTotal: Double, discount: Double, shipping: Double? = nil, total: Double? = nil, createdAt: String? = nil, paymentMethod: PaymentMethod) {
          self.init(unsafeResultMap: ["__typename": "Order", "_id": _id, "shippingDetails": shippingDetails.flatMap { (value: ShippingDetail) -> ResultMap in value.resultMap }, "billingDetails": billingDetails.flatMap { (value: BillingDetail) -> ResultMap in value.resultMap }, "products": products.flatMap { (value: [Product]) -> [ResultMap] in value.map { (value: Product) -> ResultMap in value.resultMap } }, "status": status, "subTotal": subTotal, "discount": discount, "shipping": shipping, "total": total, "createdAt": createdAt, "paymentMethod": paymentMethod])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var _id: String {
          get {
            return resultMap["_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "_id")
          }
        }

        public var shippingDetails: ShippingDetail? {
          get {
            return (resultMap["shippingDetails"] as? ResultMap).flatMap { ShippingDetail(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "shippingDetails")
          }
        }

        public var billingDetails: BillingDetail? {
          get {
            return (resultMap["billingDetails"] as? ResultMap).flatMap { BillingDetail(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "billingDetails")
          }
        }

        public var products: [Product]? {
          get {
            return (resultMap["products"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Product] in value.map { (value: ResultMap) -> Product in Product(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Product]) -> [ResultMap] in value.map { (value: Product) -> ResultMap in value.resultMap } }, forKey: "products")
          }
        }

        public var status: OrderStatus? {
          get {
            return resultMap["status"] as? OrderStatus
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        /// Subtotal price
        public var subTotal: Double {
          get {
            return resultMap["subTotal"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "subTotal")
          }
        }

        public var discount: Double {
          get {
            return resultMap["discount"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "discount")
          }
        }

        /// Shipping cost, flat rate : $5
        public var shipping: Double? {
          get {
            return resultMap["shipping"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "shipping")
          }
        }

        /// Total price including everything
        public var total: Double? {
          get {
            return resultMap["total"] as? Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "total")
          }
        }

        public var createdAt: String? {
          get {
            return resultMap["createdAt"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var paymentMethod: PaymentMethod {
          get {
            return resultMap["paymentMethod"]! as! PaymentMethod
          }
          set {
            resultMap.updateValue(newValue, forKey: "paymentMethod")
          }
        }

        public struct ShippingDetail: GraphQLSelectionSet {
          public static let possibleTypes = ["Address"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(GetAddress.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(_id: String, firstName: String, lastName: String, streetAddress: String, country: String, city: String, postCode: String, phoneNumber: String, email: String) {
            self.init(unsafeResultMap: ["__typename": "Address", "_id": _id, "firstName": firstName, "lastName": lastName, "streetAddress": streetAddress, "country": country, "city": city, "postCode": postCode, "phoneNumber": phoneNumber, "email": email])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var getAddress: GetAddress {
              get {
                return GetAddress(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public struct BillingDetail: GraphQLSelectionSet {
          public static let possibleTypes = ["Address"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(GetAddress.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(_id: String, firstName: String, lastName: String, streetAddress: String, country: String, city: String, postCode: String, phoneNumber: String, email: String) {
            self.init(unsafeResultMap: ["__typename": "Address", "_id": _id, "firstName": firstName, "lastName": lastName, "streetAddress": streetAddress, "country": country, "city": city, "postCode": postCode, "phoneNumber": phoneNumber, "email": email])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var getAddress: GetAddress {
              get {
                return GetAddress(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }

        public struct Product: GraphQLSelectionSet {
          public static let possibleTypes = ["OrderProduct"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("product", type: .object(Product.selections)),
            GraphQLField("quantity", type: .nonNull(.scalar(Int.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(product: Product? = nil, quantity: Int) {
            self.init(unsafeResultMap: ["__typename": "OrderProduct", "product": product.flatMap { (value: Product) -> ResultMap in value.resultMap }, "quantity": quantity])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var product: Product? {
            get {
              return (resultMap["product"] as? ResultMap).flatMap { Product(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "product")
            }
          }

          public var quantity: Int {
            get {
              return resultMap["quantity"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "quantity")
            }
          }

          public struct Product: GraphQLSelectionSet {
            public static let possibleTypes = ["Product"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(GetProduct.self),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var getProduct: GetProduct {
                get {
                  return GetProduct(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class SetPromoCodeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query setPromoCode($code: String!) {
      promoCodeByCode(code: $code) {
        __typename
        ...getPromoCode
      }
    }
    """

  public let operationName = "setPromoCode"

  public var queryDocument: String { return operationDefinition.appending(GetPromoCode.fragmentDefinition) }

  public var code: String

  public init(code: String) {
    self.code = code
  }

  public var variables: GraphQLMap? {
    return ["code": code]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("promoCodeByCode", arguments: ["code": GraphQLVariable("code")], type: .object(PromoCodeByCode.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(promoCodeByCode: PromoCodeByCode? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "promoCodeByCode": promoCodeByCode.flatMap { (value: PromoCodeByCode) -> ResultMap in value.resultMap }])
    }

    public var promoCodeByCode: PromoCodeByCode? {
      get {
        return (resultMap["promoCodeByCode"] as? ResultMap).flatMap { PromoCodeByCode(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "promoCodeByCode")
      }
    }

    public struct PromoCodeByCode: GraphQLSelectionSet {
      public static let possibleTypes = ["PromoCode"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(GetPromoCode.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: String, discount: Int, code: String, discountType: DiscountType, active: Bool, minimumOrderAmount: Int) {
        self.init(unsafeResultMap: ["__typename": "PromoCode", "_id": _id, "discount": discount, "code": code, "discountType": discountType, "active": active, "minimumOrderAmount": minimumOrderAmount])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var getPromoCode: GetPromoCode {
          get {
            return GetPromoCode(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetShopQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query getShop($page: Int!, $limit: Int!) {
      shops(pagination: {page: $page, limit: $limit}) {
        __typename
        docs {
          __typename
          _id
          basicInfo {
            __typename
            ...getBasicInfo
          }
        }
      }
    }
    """

  public let operationName = "getShop"

  public var queryDocument: String { return operationDefinition.appending(GetBasicInfo.fragmentDefinition) }

  public var page: Int
  public var limit: Int

  public init(page: Int, limit: Int) {
    self.page = page
    self.limit = limit
  }

  public var variables: GraphQLMap? {
    return ["page": page, "limit": limit]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("shops", arguments: ["pagination": ["page": GraphQLVariable("page"), "limit": GraphQLVariable("limit")]], type: .nonNull(.object(Shop.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(shops: Shop) {
      self.init(unsafeResultMap: ["__typename": "Query", "shops": shops.resultMap])
    }

    public var shops: Shop {
      get {
        return Shop(unsafeResultMap: resultMap["shops"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "shops")
      }
    }

    public struct Shop: GraphQLSelectionSet {
      public static let possibleTypes = ["ShopPaginateModel"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("docs", type: .nonNull(.list(.nonNull(.object(Doc.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(docs: [Doc]) {
        self.init(unsafeResultMap: ["__typename": "ShopPaginateModel", "docs": docs.map { (value: Doc) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var docs: [Doc] {
        get {
          return (resultMap["docs"] as! [ResultMap]).map { (value: ResultMap) -> Doc in Doc(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Doc) -> ResultMap in value.resultMap }, forKey: "docs")
        }
      }

      public struct Doc: GraphQLSelectionSet {
        public static let possibleTypes = ["Shop"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("basicInfo", type: .object(BasicInfo.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(_id: String, basicInfo: BasicInfo? = nil) {
          self.init(unsafeResultMap: ["__typename": "Shop", "_id": _id, "basicInfo": basicInfo.flatMap { (value: BasicInfo) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var _id: String {
          get {
            return resultMap["_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "_id")
          }
        }

        public var basicInfo: BasicInfo? {
          get {
            return (resultMap["basicInfo"] as? ResultMap).flatMap { BasicInfo(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "basicInfo")
          }
        }

        public struct BasicInfo: GraphQLSelectionSet {
          public static let possibleTypes = ["Basicinfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(GetBasicInfo.self),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(bannar: String? = nil, logo: String? = nil, shopName: String? = nil, address: String? = nil, phoneNumber: String? = nil, email: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Basicinfo", "bannar": bannar, "logo": logo, "shopName": shopName, "address": address, "phoneNumber": phoneNumber, "email": email])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var getBasicInfo: GetBasicInfo {
              get {
                return GetBasicInfo(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public final class GetShopQlQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query GetShopQl {
      shops(pagination: {page: 1, limit: 5}) {
        __typename
        docs {
          __typename
          _id
          basicInfo {
            __typename
            shopName
            owner {
              __typename
              _id
              firstName
            }
          }
        }
      }
    }
    """

  public let operationName = "GetShopQl"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("shops", arguments: ["pagination": ["page": 1, "limit": 5]], type: .nonNull(.object(Shop.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(shops: Shop) {
      self.init(unsafeResultMap: ["__typename": "Query", "shops": shops.resultMap])
    }

    public var shops: Shop {
      get {
        return Shop(unsafeResultMap: resultMap["shops"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "shops")
      }
    }

    public struct Shop: GraphQLSelectionSet {
      public static let possibleTypes = ["ShopPaginateModel"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("docs", type: .nonNull(.list(.nonNull(.object(Doc.selections))))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(docs: [Doc]) {
        self.init(unsafeResultMap: ["__typename": "ShopPaginateModel", "docs": docs.map { (value: Doc) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var docs: [Doc] {
        get {
          return (resultMap["docs"] as! [ResultMap]).map { (value: ResultMap) -> Doc in Doc(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Doc) -> ResultMap in value.resultMap }, forKey: "docs")
        }
      }

      public struct Doc: GraphQLSelectionSet {
        public static let possibleTypes = ["Shop"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("_id", type: .nonNull(.scalar(String.self))),
          GraphQLField("basicInfo", type: .object(BasicInfo.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(_id: String, basicInfo: BasicInfo? = nil) {
          self.init(unsafeResultMap: ["__typename": "Shop", "_id": _id, "basicInfo": basicInfo.flatMap { (value: BasicInfo) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var _id: String {
          get {
            return resultMap["_id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "_id")
          }
        }

        public var basicInfo: BasicInfo? {
          get {
            return (resultMap["basicInfo"] as? ResultMap).flatMap { BasicInfo(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "basicInfo")
          }
        }

        public struct BasicInfo: GraphQLSelectionSet {
          public static let possibleTypes = ["Basicinfo"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("shopName", type: .scalar(String.self)),
            GraphQLField("owner", type: .object(Owner.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(shopName: String? = nil, owner: Owner? = nil) {
            self.init(unsafeResultMap: ["__typename": "Basicinfo", "shopName": shopName, "owner": owner.flatMap { (value: Owner) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var shopName: String? {
            get {
              return resultMap["shopName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "shopName")
            }
          }

          public var owner: Owner? {
            get {
              return (resultMap["owner"] as? ResultMap).flatMap { Owner(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "owner")
            }
          }

          public struct Owner: GraphQLSelectionSet {
            public static let possibleTypes = ["User"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("_id", type: .nonNull(.scalar(String.self))),
              GraphQLField("firstName", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(_id: String, firstName: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "User", "_id": _id, "firstName": firstName])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var _id: String {
              get {
                return resultMap["_id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "_id")
              }
            }

            public var firstName: String? {
              get {
                return resultMap["firstName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "firstName")
              }
            }
          }
        }
      }
    }
  }
}

public final class GetUserAuthQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query getUserAuth($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        __typename
        ...getUser
      }
    }
    """

  public let operationName = "getUserAuth"

  public var queryDocument: String { return operationDefinition.appending(GetUser.fragmentDefinition).appending(GetAddress.fragmentDefinition) }

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .nonNull(.object(Login.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Query", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(GetUser.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var getUser: GetUser {
          get {
            return GetUser(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetLoginUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query getLoginUser($_id: ObjectId!) {
      user(_id: $_id) {
        __typename
        ...getUser
      }
    }
    """

  public let operationName = "getLoginUser"

  public var queryDocument: String { return operationDefinition.appending(GetUser.fragmentDefinition).appending(GetAddress.fragmentDefinition) }

  public var _id: String

  public init(_id: String) {
    self._id = _id
  }

  public var variables: GraphQLMap? {
    return ["_id": _id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("user", arguments: ["_id": GraphQLVariable("_id")], type: .object(User.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    public var user: User? {
      get {
        return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(GetUser.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var getUser: GetUser {
          get {
            return GetUser(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class SendSmsMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation sendSMS($phone: String!) {
      sendOtpToPhone(data: {phoneNumber: $phone})
    }
    """

  public let operationName = "sendSMS"

  public var phone: String

  public init(phone: String) {
    self.phone = phone
  }

  public var variables: GraphQLMap? {
    return ["phone": phone]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("sendOtpToPhone", arguments: ["data": ["phoneNumber": GraphQLVariable("phone")]], type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sendOtpToPhone: String) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "sendOtpToPhone": sendOtpToPhone])
    }

    public var sendOtpToPhone: String {
      get {
        return resultMap["sendOtpToPhone"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "sendOtpToPhone")
      }
    }
  }
}

public final class VerifySmsMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation verifySMS($phone: String!, $otp: String!) {
      verifyOtpPhone(data: {phoneNumber: $phone, otp: $otp})
    }
    """

  public let operationName = "verifySMS"

  public var phone: String
  public var otp: String

  public init(phone: String, otp: String) {
    self.phone = phone
    self.otp = otp
  }

  public var variables: GraphQLMap? {
    return ["phone": phone, "otp": otp]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("verifyOtpPhone", arguments: ["data": ["phoneNumber": GraphQLVariable("phone"), "otp": GraphQLVariable("otp")]], type: .nonNull(.scalar(Bool.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(verifyOtpPhone: Bool) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "verifyOtpPhone": verifyOtpPhone])
    }

    public var verifyOtpPhone: Bool {
      get {
        return resultMap["verifyOtpPhone"]! as! Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "verifyOtpPhone")
      }
    }
  }
}

public final class RegistrationByPhoneMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation registrationByPhone($fname: String!, $lname: String!, $phoneNumber: String!, $otp: String!, $email: String!, $password: String!) {
      registerUserWithPhone(data: {firstName: $fname, lastName: $lname, phoneNumber: $phoneNumber, otp: $otp, email: $email, password: $password}) {
        __typename
        ...getUser
      }
    }
    """

  public let operationName = "registrationByPhone"

  public var queryDocument: String { return operationDefinition.appending(GetUser.fragmentDefinition).appending(GetAddress.fragmentDefinition) }

  public var fname: String
  public var lname: String
  public var phoneNumber: String
  public var otp: String
  public var email: String
  public var password: String

  public init(fname: String, lname: String, phoneNumber: String, otp: String, email: String, password: String) {
    self.fname = fname
    self.lname = lname
    self.phoneNumber = phoneNumber
    self.otp = otp
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["fname": fname, "lname": lname, "phoneNumber": phoneNumber, "otp": otp, "email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("registerUserWithPhone", arguments: ["data": ["firstName": GraphQLVariable("fname"), "lastName": GraphQLVariable("lname"), "phoneNumber": GraphQLVariable("phoneNumber"), "otp": GraphQLVariable("otp"), "email": GraphQLVariable("email"), "password": GraphQLVariable("password")]], type: .nonNull(.object(RegisterUserWithPhone.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(registerUserWithPhone: RegisterUserWithPhone) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "registerUserWithPhone": registerUserWithPhone.resultMap])
    }

    public var registerUserWithPhone: RegisterUserWithPhone {
      get {
        return RegisterUserWithPhone(unsafeResultMap: resultMap["registerUserWithPhone"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "registerUserWithPhone")
      }
    }

    public struct RegisterUserWithPhone: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(GetUser.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var getUser: GetUser {
          get {
            return GetUser(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class UpdateAndCreateUserAddressMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation updateAndCreateUserAddress($fname: String!, $lname: String!, $country: String!, $streetAddress: String!, $postCode: String!, $city: String!, $phoneNumber: String!, $email: String!, $addressId: ObjectId) {
      updateOrCreateAddress(data: {firstName: $fname, lastName: $lname, country: $country, streetAddress: $streetAddress, postCode: $postCode, city: $city, phoneNumber: $phoneNumber, email: $email}, addressId: $addressId) {
        __typename
        ...getAddress
      }
    }
    """

  public let operationName = "updateAndCreateUserAddress"

  public var queryDocument: String { return operationDefinition.appending(GetAddress.fragmentDefinition) }

  public var fname: String
  public var lname: String
  public var country: String
  public var streetAddress: String
  public var postCode: String
  public var city: String
  public var phoneNumber: String
  public var email: String
  public var addressId: String?

  public init(fname: String, lname: String, country: String, streetAddress: String, postCode: String, city: String, phoneNumber: String, email: String, addressId: String? = nil) {
    self.fname = fname
    self.lname = lname
    self.country = country
    self.streetAddress = streetAddress
    self.postCode = postCode
    self.city = city
    self.phoneNumber = phoneNumber
    self.email = email
    self.addressId = addressId
  }

  public var variables: GraphQLMap? {
    return ["fname": fname, "lname": lname, "country": country, "streetAddress": streetAddress, "postCode": postCode, "city": city, "phoneNumber": phoneNumber, "email": email, "addressId": addressId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateOrCreateAddress", arguments: ["data": ["firstName": GraphQLVariable("fname"), "lastName": GraphQLVariable("lname"), "country": GraphQLVariable("country"), "streetAddress": GraphQLVariable("streetAddress"), "postCode": GraphQLVariable("postCode"), "city": GraphQLVariable("city"), "phoneNumber": GraphQLVariable("phoneNumber"), "email": GraphQLVariable("email")], "addressId": GraphQLVariable("addressId")], type: .nonNull(.object(UpdateOrCreateAddress.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateOrCreateAddress: UpdateOrCreateAddress) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateOrCreateAddress": updateOrCreateAddress.resultMap])
    }

    public var updateOrCreateAddress: UpdateOrCreateAddress {
      get {
        return UpdateOrCreateAddress(unsafeResultMap: resultMap["updateOrCreateAddress"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateOrCreateAddress")
      }
    }

    public struct UpdateOrCreateAddress: GraphQLSelectionSet {
      public static let possibleTypes = ["Address"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(GetAddress.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(_id: String, firstName: String, lastName: String, streetAddress: String, country: String, city: String, postCode: String, phoneNumber: String, email: String) {
        self.init(unsafeResultMap: ["__typename": "Address", "_id": _id, "firstName": firstName, "lastName": lastName, "streetAddress": streetAddress, "country": country, "city": city, "postCode": postCode, "phoneNumber": phoneNumber, "email": email])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var getAddress: GetAddress {
          get {
            return GetAddress(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class UserUpdateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation userUpdate($fname: String!, $lname: String!, $phoneNumber: String!, $email: String!, $_id: ObjectId!) {
      updateUser(data: {firstName: $fname, lastName: $lname, phoneNumber: $phoneNumber, email: $email}, _id: $_id) {
        __typename
        ...getUser
      }
    }
    """

  public let operationName = "userUpdate"

  public var queryDocument: String { return operationDefinition.appending(GetUser.fragmentDefinition).appending(GetAddress.fragmentDefinition) }

  public var fname: String
  public var lname: String
  public var phoneNumber: String
  public var email: String
  public var _id: String

  public init(fname: String, lname: String, phoneNumber: String, email: String, _id: String) {
    self.fname = fname
    self.lname = lname
    self.phoneNumber = phoneNumber
    self.email = email
    self._id = _id
  }

  public var variables: GraphQLMap? {
    return ["fname": fname, "lname": lname, "phoneNumber": phoneNumber, "email": email, "_id": _id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUser", arguments: ["data": ["firstName": GraphQLVariable("fname"), "lastName": GraphQLVariable("lname"), "phoneNumber": GraphQLVariable("phoneNumber"), "email": GraphQLVariable("email")], "_id": GraphQLVariable("_id")], type: .nonNull(.object(UpdateUser.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateUser: UpdateUser) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateUser": updateUser.resultMap])
    }

    public var updateUser: UpdateUser {
      get {
        return UpdateUser(unsafeResultMap: resultMap["updateUser"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateUser")
      }
    }

    public struct UpdateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(GetUser.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var getUser: GetUser {
          get {
            return GetUser(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct GetPromoCode: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment getPromoCode on PromoCode {
      __typename
      _id
      discount
      code
      discountType
      active
      minimumOrderAmount
    }
    """

  public static let possibleTypes = ["PromoCode"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("discount", type: .nonNull(.scalar(Int.self))),
    GraphQLField("code", type: .nonNull(.scalar(String.self))),
    GraphQLField("discountType", type: .nonNull(.scalar(DiscountType.self))),
    GraphQLField("active", type: .nonNull(.scalar(Bool.self))),
    GraphQLField("minimumOrderAmount", type: .nonNull(.scalar(Int.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(_id: String, discount: Int, code: String, discountType: DiscountType, active: Bool, minimumOrderAmount: Int) {
    self.init(unsafeResultMap: ["__typename": "PromoCode", "_id": _id, "discount": discount, "code": code, "discountType": discountType, "active": active, "minimumOrderAmount": minimumOrderAmount])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var _id: String {
    get {
      return resultMap["_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "_id")
    }
  }

  public var discount: Int {
    get {
      return resultMap["discount"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "discount")
    }
  }

  public var code: String {
    get {
      return resultMap["code"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "code")
    }
  }

  public var discountType: DiscountType {
    get {
      return resultMap["discountType"]! as! DiscountType
    }
    set {
      resultMap.updateValue(newValue, forKey: "discountType")
    }
  }

  public var active: Bool {
    get {
      return resultMap["active"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "active")
    }
  }

  public var minimumOrderAmount: Int {
    get {
      return resultMap["minimumOrderAmount"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "minimumOrderAmount")
    }
  }
}

public struct GetOrder: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment getOrder on Order {
      __typename
      _id
      trxId
      total
    }
    """

  public static let possibleTypes = ["Order"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("trxId", type: .scalar(String.self)),
    GraphQLField("total", type: .scalar(Double.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(_id: String, trxId: String? = nil, total: Double? = nil) {
    self.init(unsafeResultMap: ["__typename": "Order", "_id": _id, "trxId": trxId, "total": total])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var _id: String {
    get {
      return resultMap["_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "_id")
    }
  }

  public var trxId: String? {
    get {
      return resultMap["trxId"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "trxId")
    }
  }

  /// Total price including everything
  public var total: Double? {
    get {
      return resultMap["total"] as? Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "total")
    }
  }
}

public struct GetCategory: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment getCategory on Category {
      __typename
      _id
      name
    }
    """

  public static let possibleTypes = ["Category"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .scalar(String.self)),
    GraphQLField("name", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(_id: String? = nil, name: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Category", "_id": _id, "name": name])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var _id: String? {
    get {
      return resultMap["_id"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "_id")
    }
  }

  public var name: String? {
    get {
      return resultMap["name"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }
}

public struct GetAddress: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment getAddress on Address {
      __typename
      _id
      firstName
      lastName
      streetAddress
      country
      city
      postCode
      phoneNumber
      email
    }
    """

  public static let possibleTypes = ["Address"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
    GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
    GraphQLField("streetAddress", type: .nonNull(.scalar(String.self))),
    GraphQLField("country", type: .nonNull(.scalar(String.self))),
    GraphQLField("city", type: .nonNull(.scalar(String.self))),
    GraphQLField("postCode", type: .nonNull(.scalar(String.self))),
    GraphQLField("phoneNumber", type: .nonNull(.scalar(String.self))),
    GraphQLField("email", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(_id: String, firstName: String, lastName: String, streetAddress: String, country: String, city: String, postCode: String, phoneNumber: String, email: String) {
    self.init(unsafeResultMap: ["__typename": "Address", "_id": _id, "firstName": firstName, "lastName": lastName, "streetAddress": streetAddress, "country": country, "city": city, "postCode": postCode, "phoneNumber": phoneNumber, "email": email])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var _id: String {
    get {
      return resultMap["_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "_id")
    }
  }

  public var firstName: String {
    get {
      return resultMap["firstName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String {
    get {
      return resultMap["lastName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var streetAddress: String {
    get {
      return resultMap["streetAddress"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "streetAddress")
    }
  }

  public var country: String {
    get {
      return resultMap["country"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "country")
    }
  }

  public var city: String {
    get {
      return resultMap["city"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "city")
    }
  }

  public var postCode: String {
    get {
      return resultMap["postCode"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "postCode")
    }
  }

  public var phoneNumber: String {
    get {
      return resultMap["phoneNumber"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "phoneNumber")
    }
  }

  public var email: String {
    get {
      return resultMap["email"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "email")
    }
  }
}

public struct GetProduct: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment getProduct on Product {
      __typename
      _id
      name
      price
      oldPrice
      shortDescription
      description
      shop {
        __typename
        ...getShop
      }
      thumnails {
        __typename
        image
      }
      images {
        __typename
        image
      }
      variantOptions {
        __typename
        ...getVariantOption
      }
      rating {
        __typename
        ...getRating
      }
    }
    """

  public static let possibleTypes = ["Product"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("price", type: .nonNull(.scalar(Double.self))),
    GraphQLField("oldPrice", type: .nonNull(.scalar(Double.self))),
    GraphQLField("shortDescription", type: .nonNull(.scalar(String.self))),
    GraphQLField("description", type: .nonNull(.scalar(String.self))),
    GraphQLField("shop", type: .nonNull(.object(Shop.selections))),
    GraphQLField("thumnails", type: .list(.nonNull(.object(Thumnail.selections)))),
    GraphQLField("images", type: .list(.nonNull(.object(Image.selections)))),
    GraphQLField("variantOptions", type: .list(.nonNull(.object(VariantOption.selections)))),
    GraphQLField("rating", type: .nonNull(.object(Rating.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(_id: String, name: String, price: Double, oldPrice: Double, shortDescription: String, description: String, shop: Shop, thumnails: [Thumnail]? = nil, images: [Image]? = nil, variantOptions: [VariantOption]? = nil, rating: Rating) {
    self.init(unsafeResultMap: ["__typename": "Product", "_id": _id, "name": name, "price": price, "oldPrice": oldPrice, "shortDescription": shortDescription, "description": description, "shop": shop.resultMap, "thumnails": thumnails.flatMap { (value: [Thumnail]) -> [ResultMap] in value.map { (value: Thumnail) -> ResultMap in value.resultMap } }, "images": images.flatMap { (value: [Image]) -> [ResultMap] in value.map { (value: Image) -> ResultMap in value.resultMap } }, "variantOptions": variantOptions.flatMap { (value: [VariantOption]) -> [ResultMap] in value.map { (value: VariantOption) -> ResultMap in value.resultMap } }, "rating": rating.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var _id: String {
    get {
      return resultMap["_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "_id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var price: Double {
    get {
      return resultMap["price"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "price")
    }
  }

  public var oldPrice: Double {
    get {
      return resultMap["oldPrice"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "oldPrice")
    }
  }

  public var shortDescription: String {
    get {
      return resultMap["shortDescription"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "shortDescription")
    }
  }

  public var description: String {
    get {
      return resultMap["description"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  public var shop: Shop {
    get {
      return Shop(unsafeResultMap: resultMap["shop"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "shop")
    }
  }

  /// For thumbnails images
  public var thumnails: [Thumnail]? {
    get {
      return (resultMap["thumnails"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Thumnail] in value.map { (value: ResultMap) -> Thumnail in Thumnail(unsafeResultMap: value) } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Thumnail]) -> [ResultMap] in value.map { (value: Thumnail) -> ResultMap in value.resultMap } }, forKey: "thumnails")
    }
  }

  /// For details images
  public var images: [Image]? {
    get {
      return (resultMap["images"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Image] in value.map { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Image]) -> [ResultMap] in value.map { (value: Image) -> ResultMap in value.resultMap } }, forKey: "images")
    }
  }

  public var variantOptions: [VariantOption]? {
    get {
      return (resultMap["variantOptions"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [VariantOption] in value.map { (value: ResultMap) -> VariantOption in VariantOption(unsafeResultMap: value) } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [VariantOption]) -> [ResultMap] in value.map { (value: VariantOption) -> ResultMap in value.resultMap } }, forKey: "variantOptions")
    }
  }

  public var rating: Rating {
    get {
      return Rating(unsafeResultMap: resultMap["rating"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "rating")
    }
  }

  public struct Shop: GraphQLSelectionSet {
    public static let possibleTypes = ["Shop"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(GetShop.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var getShop: GetShop {
        get {
          return GetShop(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Thumnail: GraphQLSelectionSet {
    public static let possibleTypes = ["Image"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("image", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(image: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Image", "image": image])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var image: String? {
      get {
        return resultMap["image"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "image")
      }
    }
  }

  public struct Image: GraphQLSelectionSet {
    public static let possibleTypes = ["Image"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("image", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(image: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Image", "image": image])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var image: String? {
      get {
        return resultMap["image"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "image")
      }
    }
  }

  public struct VariantOption: GraphQLSelectionSet {
    public static let possibleTypes = ["VariantOption"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(GetVariantOption.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var getVariantOption: GetVariantOption {
        get {
          return GetVariantOption(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Rating: GraphQLSelectionSet {
    public static let possibleTypes = ["Rating"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(GetRating.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var getRating: GetRating {
        get {
          return GetRating(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct GetShop: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment getShop on Shop {
      __typename
      shippingInfo {
        __typename
        ...getShippinginfo
      }
    }
    """

  public static let possibleTypes = ["Shop"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("shippingInfo", type: .nonNull(.object(ShippingInfo.selections))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(shippingInfo: ShippingInfo) {
    self.init(unsafeResultMap: ["__typename": "Shop", "shippingInfo": shippingInfo.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var shippingInfo: ShippingInfo {
    get {
      return ShippingInfo(unsafeResultMap: resultMap["shippingInfo"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "shippingInfo")
    }
  }

  public struct ShippingInfo: GraphQLSelectionSet {
    public static let possibleTypes = ["Shippinginfo"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(GetShippinginfo.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(shippingPolicy: String? = nil, refundPolicy: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Shippinginfo", "shippingPolicy": shippingPolicy, "refundPolicy": refundPolicy])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var getShippinginfo: GetShippinginfo {
        get {
          return GetShippinginfo(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct GetShippinginfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment getShippinginfo on Shippinginfo {
      __typename
      shippingPolicy
      refundPolicy
    }
    """

  public static let possibleTypes = ["Shippinginfo"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("shippingPolicy", type: .scalar(String.self)),
    GraphQLField("refundPolicy", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(shippingPolicy: String? = nil, refundPolicy: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Shippinginfo", "shippingPolicy": shippingPolicy, "refundPolicy": refundPolicy])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var shippingPolicy: String? {
    get {
      return resultMap["shippingPolicy"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "shippingPolicy")
    }
  }

  public var refundPolicy: String? {
    get {
      return resultMap["refundPolicy"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "refundPolicy")
    }
  }
}

public struct GetRating: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment getRating on Rating {
      __typename
      value
      userCount
      ratingCount {
        __typename
        ...getRatingCount
      }
    }
    """

  public static let possibleTypes = ["Rating"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("value", type: .scalar(Double.self)),
    GraphQLField("userCount", type: .scalar(Int.self)),
    GraphQLField("ratingCount", type: .object(RatingCount.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(value: Double? = nil, userCount: Int? = nil, ratingCount: RatingCount? = nil) {
    self.init(unsafeResultMap: ["__typename": "Rating", "value": value, "userCount": userCount, "ratingCount": ratingCount.flatMap { (value: RatingCount) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var value: Double? {
    get {
      return resultMap["value"] as? Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "value")
    }
  }

  public var userCount: Int? {
    get {
      return resultMap["userCount"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "userCount")
    }
  }

  public var ratingCount: RatingCount? {
    get {
      return (resultMap["ratingCount"] as? ResultMap).flatMap { RatingCount(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "ratingCount")
    }
  }

  public struct RatingCount: GraphQLSelectionSet {
    public static let possibleTypes = ["RatingCount"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(GetRatingCount.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(five: Double? = nil, four: Double? = nil, three: Double? = nil, two: Double? = nil, one: Double? = nil) {
      self.init(unsafeResultMap: ["__typename": "RatingCount", "five": five, "four": four, "three": three, "two": two, "one": one])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var getRatingCount: GetRatingCount {
        get {
          return GetRatingCount(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct GetRatingCount: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment getRatingCount on RatingCount {
      __typename
      five
      four
      three
      two
      one
    }
    """

  public static let possibleTypes = ["RatingCount"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("five", type: .scalar(Double.self)),
    GraphQLField("four", type: .scalar(Double.self)),
    GraphQLField("three", type: .scalar(Double.self)),
    GraphQLField("two", type: .scalar(Double.self)),
    GraphQLField("one", type: .scalar(Double.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(five: Double? = nil, four: Double? = nil, three: Double? = nil, two: Double? = nil, one: Double? = nil) {
    self.init(unsafeResultMap: ["__typename": "RatingCount", "five": five, "four": four, "three": three, "two": two, "one": one])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var five: Double? {
    get {
      return resultMap["five"] as? Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "five")
    }
  }

  public var four: Double? {
    get {
      return resultMap["four"] as? Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "four")
    }
  }

  public var three: Double? {
    get {
      return resultMap["three"] as? Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "three")
    }
  }

  public var two: Double? {
    get {
      return resultMap["two"] as? Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "two")
    }
  }

  public var one: Double? {
    get {
      return resultMap["one"] as? Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "one")
    }
  }
}

public struct GetVariantOption: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment getVariantOption on VariantOption {
      __typename
      _id
      name
      displayName
      type
      selection {
        __typename
        _id
        name
        displayName
        value
        status
      }
      values {
        __typename
        _id
        name
        displayName
        value
        status
      }
    }
    """

  public static let possibleTypes = ["VariantOption"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
    GraphQLField("type", type: .nonNull(.scalar(String.self))),
    GraphQLField("selection", type: .object(Selection.selections)),
    GraphQLField("values", type: .list(.nonNull(.object(Value.selections)))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(_id: String, name: String, displayName: String, type: String, selection: Selection? = nil, values: [Value]? = nil) {
    self.init(unsafeResultMap: ["__typename": "VariantOption", "_id": _id, "name": name, "displayName": displayName, "type": type, "selection": selection.flatMap { (value: Selection) -> ResultMap in value.resultMap }, "values": values.flatMap { (value: [Value]) -> [ResultMap] in value.map { (value: Value) -> ResultMap in value.resultMap } }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var _id: String {
    get {
      return resultMap["_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "_id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var displayName: String {
    get {
      return resultMap["displayName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "displayName")
    }
  }

  public var type: String {
    get {
      return resultMap["type"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "type")
    }
  }

  public var selection: Selection? {
    get {
      return (resultMap["selection"] as? ResultMap).flatMap { Selection(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "selection")
    }
  }

  public var values: [Value]? {
    get {
      return (resultMap["values"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Value] in value.map { (value: ResultMap) -> Value in Value(unsafeResultMap: value) } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Value]) -> [ResultMap] in value.map { (value: Value) -> ResultMap in value.resultMap } }, forKey: "values")
    }
  }

  public struct Selection: GraphQLSelectionSet {
    public static let possibleTypes = ["VariantOptionValues"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
      GraphQLField("value", type: .nonNull(.scalar(String.self))),
      GraphQLField("status", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(_id: String, name: String, displayName: String, value: String, status: String) {
      self.init(unsafeResultMap: ["__typename": "VariantOptionValues", "_id": _id, "name": name, "displayName": displayName, "value": value, "status": status])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var _id: String {
      get {
        return resultMap["_id"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "_id")
      }
    }

    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var displayName: String {
      get {
        return resultMap["displayName"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "displayName")
      }
    }

    public var value: String {
      get {
        return resultMap["value"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "value")
      }
    }

    public var status: String {
      get {
        return resultMap["status"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }
  }

  public struct Value: GraphQLSelectionSet {
    public static let possibleTypes = ["VariantOptionValues"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("_id", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("displayName", type: .nonNull(.scalar(String.self))),
      GraphQLField("value", type: .nonNull(.scalar(String.self))),
      GraphQLField("status", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(_id: String, name: String, displayName: String, value: String, status: String) {
      self.init(unsafeResultMap: ["__typename": "VariantOptionValues", "_id": _id, "name": name, "displayName": displayName, "value": value, "status": status])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var _id: String {
      get {
        return resultMap["_id"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "_id")
      }
    }

    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }

    public var displayName: String {
      get {
        return resultMap["displayName"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "displayName")
      }
    }

    public var value: String {
      get {
        return resultMap["value"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "value")
      }
    }

    public var status: String {
      get {
        return resultMap["status"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "status")
      }
    }
  }
}

public struct GetBasicInfo: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment getBasicInfo on Basicinfo {
      __typename
      bannar
      logo
      shopName
      address
      phoneNumber
      email
    }
    """

  public static let possibleTypes = ["Basicinfo"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("bannar", type: .scalar(String.self)),
    GraphQLField("logo", type: .scalar(String.self)),
    GraphQLField("shopName", type: .scalar(String.self)),
    GraphQLField("address", type: .scalar(String.self)),
    GraphQLField("phoneNumber", type: .scalar(String.self)),
    GraphQLField("email", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(bannar: String? = nil, logo: String? = nil, shopName: String? = nil, address: String? = nil, phoneNumber: String? = nil, email: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "Basicinfo", "bannar": bannar, "logo": logo, "shopName": shopName, "address": address, "phoneNumber": phoneNumber, "email": email])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var bannar: String? {
    get {
      return resultMap["bannar"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "bannar")
    }
  }

  public var logo: String? {
    get {
      return resultMap["logo"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "logo")
    }
  }

  public var shopName: String? {
    get {
      return resultMap["shopName"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "shopName")
    }
  }

  public var address: String? {
    get {
      return resultMap["address"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "address")
    }
  }

  public var phoneNumber: String? {
    get {
      return resultMap["phoneNumber"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "phoneNumber")
    }
  }

  public var email: String? {
    get {
      return resultMap["email"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "email")
    }
  }
}

public struct GetUser: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition =
    """
    fragment getUser on User {
      __typename
      _id
      avatar
      firstName
      lastName
      phoneNumber
      email
      addresses {
        __typename
        ...getAddress
      }
      token
    }
    """

  public static let possibleTypes = ["User"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("_id", type: .nonNull(.scalar(String.self))),
    GraphQLField("avatar", type: .scalar(String.self)),
    GraphQLField("firstName", type: .scalar(String.self)),
    GraphQLField("lastName", type: .scalar(String.self)),
    GraphQLField("phoneNumber", type: .scalar(String.self)),
    GraphQLField("email", type: .scalar(String.self)),
    GraphQLField("addresses", type: .list(.nonNull(.object(Address.selections)))),
    GraphQLField("token", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(_id: String, avatar: String? = nil, firstName: String? = nil, lastName: String? = nil, phoneNumber: String? = nil, email: String? = nil, addresses: [Address]? = nil, token: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "User", "_id": _id, "avatar": avatar, "firstName": firstName, "lastName": lastName, "phoneNumber": phoneNumber, "email": email, "addresses": addresses.flatMap { (value: [Address]) -> [ResultMap] in value.map { (value: Address) -> ResultMap in value.resultMap } }, "token": token])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var _id: String {
    get {
      return resultMap["_id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "_id")
    }
  }

  public var avatar: String? {
    get {
      return resultMap["avatar"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "avatar")
    }
  }

  public var firstName: String? {
    get {
      return resultMap["firstName"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String? {
    get {
      return resultMap["lastName"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var phoneNumber: String? {
    get {
      return resultMap["phoneNumber"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "phoneNumber")
    }
  }

  public var email: String? {
    get {
      return resultMap["email"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "email")
    }
  }

  /// Addresses of user
  public var addresses: [Address]? {
    get {
      return (resultMap["addresses"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Address] in value.map { (value: ResultMap) -> Address in Address(unsafeResultMap: value) } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Address]) -> [ResultMap] in value.map { (value: Address) -> ResultMap in value.resultMap } }, forKey: "addresses")
    }
  }

  public var token: String? {
    get {
      return resultMap["token"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "token")
    }
  }

  public struct Address: GraphQLSelectionSet {
    public static let possibleTypes = ["Address"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLFragmentSpread(GetAddress.self),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(_id: String, firstName: String, lastName: String, streetAddress: String, country: String, city: String, postCode: String, phoneNumber: String, email: String) {
      self.init(unsafeResultMap: ["__typename": "Address", "_id": _id, "firstName": firstName, "lastName": lastName, "streetAddress": streetAddress, "country": country, "city": city, "postCode": postCode, "phoneNumber": phoneNumber, "email": email])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var getAddress: GetAddress {
        get {
          return GetAddress(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}
