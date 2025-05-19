import React, { Component } from 'react';
import { ICategory } from '../interfaces/category.interface';
import { IProduct } from '../interfaces/product.interface';
import 'react-toastify/dist/ReactToastify.css';
import { ICustomer } from '../interfaces/customer.interface';
interface ICartItem extends IProduct {
    cartId: string;
    tax_rate: number | undefined;
    vat_type: string;
    discount: number | undefined;
    quantity: number | undefined;
    price_type: number;
}
interface Salesman {
    id: string;
    salesman_name: string;
}
interface Root {
    id: string;
    root_name: string;
}
interface Line {
    id: string;
    location: string;
}
interface Bucket {
    id: number;
    category_name: string;
    stock: number;
}
interface BucketInput {
    id: number;
    category_name: string;
    stock: number;
    qty: number;
    cost: number;
}
type Props = {
    settings: any;
};
type State = {
    categories: ICategory[];
    products: IProduct[];
    customers: ICustomer[];
    customer: ICustomer | undefined;
    customerName: string | null;
    customerEmail: string | null;
    customerMobile: string | null;
    customerCity: string | null;
    customerBuilding: string | null;
    customerStreet: string | null;
    customerFloor: string | null;
    customerApartment: string | null;
    bucketNumber: string | null;
    cart: ICartItem[];
    showProducts: boolean;
    categoryName: string | null;
    total: number;
    subtotal: number;
    tax: number | undefined;
    vatType: string;
    deliveryCharge: number | undefined;
    discount: number | undefined;
    hasaudio: boolean | undefined;
    tenderAmount: number | undefined;
    returnAmount: number | undefined;
    customerAmount: number | undefined;
    searchValue: string | null;
    remarks: string | null;
    orderType: string;
    isFullScreen: boolean;
    isLoading: boolean;
    isLoadingCategories: boolean;
    selectItem: string;
    currentPrice: number;
    isPaid: boolean;
    isQuotation: boolean;
    bucketId: string;
    bucketName: string;
    bucketStock: number;
    bucketUnitPrice: number;
    bucketTotalPrice: number;
    selectedSalesmanId: string;
    selectedBucketId: string | undefined;
    selectedSalesman: Salesman | undefined;
    selectedRootId: string;
    selectedRoot: Root | undefined;
    selectedLineId: string;
    currency: string;
    selectedLine: Line | undefined;
    salesmen: Salesman[];
    roots: Root[];
    lines: Line[];
    buckets: Bucket[];
    bucketInputs: {
        [key: number]: BucketInput;
    };
    total_buckets: number;
    returnBucketInputs: {
        [key: number]: BucketInput;
    };
    returnBucketTotalPrice: number;
    plastic_bucket_stock: {
        [key: number]: Bucket;
    };
};
declare class PointOfSale extends Component<Props, State> {
    constructor(props: Props);
    updateTotalPrice: (bucketInputs?: {
        [key: number]: BucketInput;
    }) => void;
    handleQtyChange: (bucketId: number, event: React.ChangeEvent<HTMLInputElement>) => void;
    handleCostChange: (bucketId: number, event: React.ChangeEvent<HTMLInputElement>) => void;
    handleReturnQtyChange: (bucketId: number, event: React.ChangeEvent<HTMLInputElement>) => void;
    handleReturnCostChange: (bucketId: number, event: React.ChangeEvent<HTMLInputElement>) => void;
    updateReturnTotalPrice: (returnBucketInputs?: {
        [key: number]: BucketInput;
    }) => void;
    handleStockChange: (bucketId: number, event: React.ChangeEvent<HTMLInputElement>) => void;
    componentDidMount(): void;
    specialCustomerPrice: (prod: IProduct) => number;
    getCategories: () => void;
    storeOrder: () => void;
    reset: () => void;
    scan_barcode: () => void;
    resetPos: () => void;
    togglePaidButton: () => void;
    categoryClick: (category: ICategory) => void;
    backClick: () => void;
    handleDiscountChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
    handleTaxChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
    handleDeliveryChargeChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
    updateItemPrice: (event: React.ChangeEvent<HTMLInputElement>, item: ICartItem) => void;
    updateItemQtyByClick: (event: any, item: ICartItem, qty: number) => void;
    toggleFullScreen: () => void;
    goToDashboard: () => void;
    calculateItemPrice: (item: ICartItem) => number;
    calculateTotal: () => void;
    getVat: () => number;
    getTaxAmount: () => number;
    getTotalTax: () => number;
    getChangeAmount: () => number;
    handleTenderAmountChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
    handleCustomerAmountChange: (event: React.ChangeEvent<HTMLInputElement>) => void;
    handleRemarksChange: (event: React.FormEvent<HTMLTextAreaElement>) => void;
    removeItem: (item: ICartItem) => void;
    addToCart: (product: IProduct, price_type?: number) => void;
    handleSearchSubmit: (event: React.FormEvent<HTMLFormElement>) => void;
    handleSearchChange: (event: React.FormEvent<HTMLInputElement>) => void;
    handleVatTypeChange: (event: any) => void;
    handleSelectItem: (e: React.FormEvent<HTMLSelectElement>) => void;
    handleCustomerSearchChange: (event: React.FormEvent<HTMLInputElement>) => void;
    setCustomer: (customer: ICustomer) => void;
    selectCustomer(customer: ICustomer): void;
    closeModal: (id: string) => void;
    getAppSettings: () => any;
    currencyFormatValue: (number: any) => any;
    receiptExchangeRate: () => any;
    removeCustomer(): void;
    isProductAvailable: (product: IProduct) => boolean;
    updateItemQuantity: (event: React.ChangeEvent<HTMLInputElement>, item: ICartItem) => void;
    updateItemPriceType: (event: React.ChangeEvent<HTMLSelectElement>, item: ICartItem) => void;
    updateItemVatType: (item: ICartItem) => void;
    updateItemVAT: (event: React.ChangeEvent<HTMLInputElement>, item: ICartItem) => void;
    updateItemDiscount: (event: React.ChangeEvent<HTMLInputElement>, item: ICartItem) => void;
    createCustomer: (e: React.FormEvent<HTMLFormElement>) => void;
    handleCustomerNameChange: (event: React.FormEvent<HTMLInputElement>) => void;
    handleCustomerEmailChange: (event: React.FormEvent<HTMLInputElement>) => void;
    handleCustomerMobileChange: (event: React.FormEvent<HTMLInputElement>) => void;
    handleCustomerCityChange: (event: React.FormEvent<HTMLInputElement>) => void;
    handleCustomerStreetChange: (event: React.FormEvent<HTMLInputElement>) => void;
    handleCustomerBuildingChange: (event: React.FormEvent<HTMLInputElement>) => void;
    handleCustomerFloorChange: (event: React.FormEvent<HTMLInputElement>) => void;
    handleCustomerApartmentChange: (event: React.FormEvent<HTMLInputElement>) => void;
    handleCustomerBucketChange: (event: React.FormEvent<HTMLInputElement>) => void;
    printInvoice: (data: any, settings: any) => void;
    modalCloseButton: () => React.ReactNode;
    modalCloseButtonWhite: () => React.ReactNode;
    handleOrderTypeChange: (event: React.ChangeEvent<HTMLSelectElement>) => void;
    isOrderDelivery: () => boolean;
    allProducts: () => IProduct[];
    handleCloseModal: () => void;
    handleIsSalesmanChange: (e: React.ChangeEvent<HTMLSelectElement>) => void;
    handleCurrencyChange: (e: React.ChangeEvent<HTMLSelectElement>) => void;
    handleIsRootChange: (e: React.ChangeEvent<HTMLSelectElement>) => void;
    handleIsLineChange: (e: React.ChangeEvent<HTMLSelectElement>) => void;
    handleIsQuotationChange: (event: React.ChangeEvent<HTMLSelectElement>) => void;
    handleBucketIdChange: (event: React.ChangeEvent<HTMLSelectElement>) => void;
    removeBucket(): void;
    handlebucketStock: (event: React.ChangeEvent<HTMLInputElement>) => void;
    handleBucketUnitPrice: (event: React.ChangeEvent<HTMLInputElement>) => void;
    pricesFilter: () => React.ReactNode;
    handleSelectRadio: (index: number) => void;
    pricesFilterModal: () => React.ReactNode;
    render(): JSX.Element;
}
export default PointOfSale;
