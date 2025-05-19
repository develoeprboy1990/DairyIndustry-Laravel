import React, { Component } from 'react';
import axios from 'axios';
import ReactDOM from 'react-dom/client';
import Swal from 'sweetalert2';
import { ICategory } from '../interfaces/category.interface';
import { IProduct } from '../interfaces/product.interface';
import httpService from '../services/http.service';
import { currency_format, floatValue, swalConfig, t } from '../utils';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { isFullScreen, toogleFullScreen } from '../fullscreen';
import { ICustomer } from '../interfaces/customer.interface';
import { Modal } from 'bootstrap';
import uuid from 'react-uuid';
import { ArrowRightIcon, XCircleIcon, Squares2X2Icon, ArrowPathIcon, ArrowLeftIcon, ChevronDownIcon } from '@heroicons/react/24/outline';
import { UserCircleIcon } from '@heroicons/react/24/solid';

// @ts-ignore
import Quagga from 'quagga';

const priceFilterList = [
    'Unit Prices',
    'Box Prices',
    'Wholesale Price',
    // "Price per Gram",
    // "Price per Kilogram"
    'Currency',
];

const currencyFilterList = [
    'USD',
    'LLP',
]

const tableStyles: React.CSSProperties = {
    width: '100%',
    tableLayout: 'auto',
    borderCollapse: 'collapse', // 'collapse' is now correctly typed
  };

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

// ==== mbb 11 Feb 2025
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
    bucketNumber : string | null;
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
    bucketInputs: { [key: number]: BucketInput };
    total_buckets : number;
    returnBucketInputs: { [key: number]: BucketInput }; // For returned buckets
    returnBucketTotalPrice: number;
    plastic_bucket_stock: { [key: number]: Bucket };
};

class PointOfSale extends Component<Props, State> {
    constructor(props: Props) {
        super(props);

        this.state = {
            categories: [],
            products: [],
            cart: [],
            customers: [],
            customer: undefined,
            customerName: null,
            customerEmail: null,
            customerMobile: null,
            customerCity: null,
            customerBuilding: null,
            customerStreet: null,
            customerFloor: null,
            customerApartment: null,
            bucketNumber : null,
            showProducts: false,
            categoryName: null,
            orderType: 'takeout',
            subtotal: 0,
            total: 0,
            tax: 0,
            vatType: this.getAppSettings().vatType,
            deliveryCharge: 0,
            hasaudio: true,
            discount: 0,
            searchValue: null,
            remarks: null,
            isFullScreen: isFullScreen(),
            tenderAmount: 0,
            returnAmount: 0,
            customerAmount: 0,
            isLoading: false,
            isLoadingCategories: true,
            selectItem: 'first',
            currentPrice: 0,
            currency: "USD",
            isPaid: true,
            isQuotation: false,
            bucketId: '',
            bucketName: '',
            bucketStock: 0,
            bucketUnitPrice: 0,
            bucketTotalPrice: 0,
            selectedSalesmanId: '',
            selectedBucketId: undefined,
            selectedRootId: '',
            selectedLineId: '',
            selectedSalesman: undefined,
            selectedRoot: undefined,
            selectedLine: undefined,
            salesmen: [],
            roots: [],
            lines: [],
            buckets: [],
            bucketInputs: {},
            total_buckets : 0,
            returnBucketInputs: {},
            returnBucketTotalPrice: 0,
            plastic_bucket_stock: {}
        };
    }

    // -----------------
    updateTotalPrice = (bucketInputs = this.state.bucketInputs) => {
        const overallTotal = Object.values(bucketInputs).reduce(
          (acc, { qty = 0, cost = 0 }) => acc + qty * cost,
          0
        );
        this.setState({ bucketTotalPrice: overallTotal }, () => this.calculateTotal());
    };

    // Handler for quantity change.
    handleQtyChange = (
        bucketId: number,
        event: React.ChangeEvent<HTMLInputElement>
      ) => {
        const qty = parseFloat(event.target.value) || 0;
        this.setState(
          (prevState) => ({
            bucketInputs: {
              ...prevState.bucketInputs,
              [bucketId]: {
                ...prevState.bucketInputs[bucketId],
                qty,
              },
            },
          }),
          () => this.updateTotalPrice(this.state.bucketInputs)
        );
      };
      


    // Handler for cost change.
    handleCostChange = (
        bucketId: number,
        event: React.ChangeEvent<HTMLInputElement>
      ) => {
        const cost = parseFloat(event.target.value) || 0;
        this.setState(
          (prevState) => ({
            bucketInputs: {
              ...prevState.bucketInputs,
              [bucketId]: {
                ...prevState.bucketInputs[bucketId],
                cost,
              },
            },
          }),
          () => this.updateTotalPrice(this.state.bucketInputs)
        );
      };

    // ===============================
    // Handlers for returned buckets
    // ===============================
    handleReturnQtyChange = (bucketId: number, event: React.ChangeEvent<HTMLInputElement>) => {
        const qty = parseFloat(event.target.value) || 0;
        this.setState(
        (prevState) => ({
            returnBucketInputs: {
            ...prevState.returnBucketInputs,
            [bucketId]: {
                ...prevState.returnBucketInputs[bucketId],
                qty,
            },
            },
        }),
        () => this.updateReturnTotalPrice(this.state.returnBucketInputs)
        );
    };

    handleReturnCostChange = (bucketId: number, event: React.ChangeEvent<HTMLInputElement>) => {
        const cost = parseFloat(event.target.value) || 0;
        this.setState(
        (prevState) => ({
            returnBucketInputs: {
            ...prevState.returnBucketInputs,
            [bucketId]: {
                ...prevState.returnBucketInputs[bucketId],
                cost,
            },
            },
        }),
        () => this.updateReturnTotalPrice(this.state.returnBucketInputs)
        );
    };

    updateReturnTotalPrice = (returnBucketInputs = this.state.returnBucketInputs) => {
        const overallReturnTotal = Object.values(returnBucketInputs).reduce(
        (acc, { qty = 0, cost = 0 }) => acc + qty * cost,
        0
        );
        this.setState({ returnBucketTotalPrice: overallReturnTotal }, () => this.calculateTotal());
    };

    // ===============================
    // Handlers for returned buckets
    // ===============================

    // Update the stock value for a given bucket in plastic_bucket_stock.
    handleStockChange = (bucketId: number, event: React.ChangeEvent<HTMLInputElement>) => {
        const stock = parseInt(event.target.value, 10) || 0;
        this.setState((prevState) => ({
            plastic_bucket_stock: {
            ...prevState.plastic_bucket_stock,
            [bucketId]: {
            ...prevState.plastic_bucket_stock[bucketId],
            stock,
            },
        },
        }));
    };


    componentDidMount() {
        var settings = this.getAppSettings();

        this.setState({ tax: settings.taxRate });
        this.setState({ deliveryCharge: settings.deliveryCharge });
        this.setState({ discount: settings.discount });
        this.setState({ hasaudio: settings.newItemAudio });
        this.setState({ vatType: settings.vatType });

        this.getCategories();
        this.calculateTotal();
        // this.getBuckets(); 
        this.setState({ tenderAmount: this.state.total });
        window.onbeforeunload = event => {
            return 'Are you sure?';
        };

        axios
            .get('/api/salesmen')
            .then(response => {
                // Set the fetched data to the state
                const { salesmen, roots, lines } = response.data;
                this.setState({ salesmen, roots, lines });
            })
            .catch(error => {
                console.error('Error fetching data!', error);
            });

        // === set the bucket data
        axios
            .get('/api/getBuckets')
            .then(response => {
                // Set the fetched data to the state
                const { buckets } = response.data;
                this.setState({ buckets});

                this.setState({bucketInputs : buckets.reduce((acc: { [key: number]: BucketInput }, bucket: BucketInput) => {
                    acc[bucket.id] = bucket;
                    return acc;
                    }, {} as { [key: number]: BucketInput })
                });

                this.setState({returnBucketInputs : buckets.reduce((acc: { [key: number]: BucketInput }, bucket: BucketInput) => {
                    acc[bucket.id] = { ...bucket };
                    return acc;
                    }, {} as { [key: number]: BucketInput })
                });

                this.setState({ plastic_bucket_stock :  buckets.reduce(
                    (acc: { [key: number]: Bucket }, bucket: Bucket) => {
                      acc[bucket.id] = { ...bucket, stock: 0 };
                      return acc;
                    },
                    {} as { [key: number]: Bucket }
                    )
                });
                    
            })
            .catch(error => {
                console.error('Error fetching data!', error);
            });
    }

    specialCustomerPrice = (prod: IProduct): number => {
        if (!this.state.customer) return prod.price || 0;
        if (this.state.customer.order_details.length == 0) return prod.price || 0;
        var newProd = this.state.customer.order_details.find(p => p.product_id === prod.id);
        if (!newProd) return prod.price || 0;
        return newProd.price || 0;
    };

    getCategories = (): void => {
        // console.log("ASDASD");
        httpService
            .get(`inventory/categories`)
            .then((response: any) => {
                this.setState({ categories: response.data.data });
            })
            .finally(() => {
                this.setState({ isLoadingCategories: false });
            });
    };

    storeOrder = (): void => {
        if (this.state.cart.length == 0) {
            toast.error(t('No items has been added!', 'لم يتم إضافة اية اصناف!'));
            return;
        }

        this.setState({ isLoading: true });
        var _deliveryCharge = 0;
        if (this.getAppSettings().enableTakeoutAndDelivery) {
            _deliveryCharge = this.isOrderDelivery() ? this.state.deliveryCharge || 0 : 0;
        } else {
            _deliveryCharge = this.state.deliveryCharge || 0;
        }

        // console.log(this.state);
        // sdfdsf;
        httpService
            .post(`/order`, {
                customer: this.state.customer,
                cart: this.state.cart,
                subtotal: this.state.subtotal,
                total: this.state.total,
                tax_rate: this.state.tax || 0,
                vat_type: this.state.vatType,
                delivery_charge: _deliveryCharge,
                discount: this.state.discount || 0,
                remarks: this.state.remarks,
                type: this.state.orderType,
                tender_amount: this.state.tenderAmount || 0,
                return_amount: this.state.returnAmount || 0,
                price_type: this.state.currentPrice || 0,
                paid: this.state.isPaid,
                is_quotation: this.state.isQuotation,
                bucketId: this.state.bucketId,
                bucketName: this.state.bucketName,
                bucketStock: this.state.bucketStock,
                bucketUnitPrice: this.state.bucketUnitPrice,
                salesman_name: this.state.selectedSalesman?.salesman_name,
                root_name: this.state.selectedRoot?.root_name,
                line_name: this.state.selectedLine?.location,
                currency: this.state.currency,
                bucketInputs: this.state.bucketInputs,
                bucketTotalPrice: this.state.bucketTotalPrice,
                returnBucketInputs: this.state.returnBucketInputs,
                returnBucketTotalPrice: this.state.returnBucketTotalPrice,
            })
            .then((response: any) => {
                if (response.data) {
                    this.resetPos();
                    toast.info(t('Saved!', 'تم الحفظ'));
                    this.closeModal('checkoutModal');
                    console.log(response.data);
                    this.printInvoice(response.data, this.getAppSettings());
                }
            })
            .finally(() => {
                console.log({
                    customer: this.state.customer,
                    cart: this.state.cart,
                    subtotal: this.state.subtotal,
                    total: this.state.total,
                    tax_rate: this.state.tax || 0,
                    vat_type: this.state.vatType,
                    delivery_charge: _deliveryCharge,
                    discount: this.state.discount || 0,
                    remarks: this.state.remarks,
                    type: this.state.orderType,
                    tender_amount: this.state.tenderAmount || 0,
                    return_amount: this.state.returnAmount || 0,
                    customer_amount: this.state.customerAmount || 0,
                    price_type: this.state.currentPrice || 0,
                    paid: this.state.isPaid,
                    is_quotation: this.state.isQuotation,
                    salesman_name: this.state.selectedSalesman?.salesman_name,
                    root_name: this.state.selectedRoot?.root_name,
                    line_name: this.state.selectedLine?.location,
                    currency: this.state.currency,
                    bucketTotalPrice: this.state.bucketTotalPrice,
                    bucketInputs: this.state.bucketInputs,
                });
                this.setState({ isLoading: false });
            });
    };
    reset = (): void => {
        Swal.fire({
            title: t('Reset?', 'إعادة ضبط'),
            text: t('Any unsaved changes will be lost', 'ستفقد أي تغييرات غير محفوظة'),
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: t('Reset?', 'إعادة ضبط'),
            cancelButtonText: t('Cancel', 'إلغاء')
        }).then(result => {
            if (result.isConfirmed) {
                this.resetPos();
            }
        });
    };


    // --- Scan Barcode
    scan_barcode = (): void => {
        const scannerOverlay = document.createElement('div');
        scannerOverlay.id = 'scanner-overlay';
        scannerOverlay.style.position = 'fixed';
        scannerOverlay.style.top = '0';
        scannerOverlay.style.left = '0';
        scannerOverlay.style.width = '100%';
        scannerOverlay.style.height = '100%';
        scannerOverlay.style.backgroundColor = 'rgba(0, 0, 0, 0.5)';
        scannerOverlay.style.display = 'flex';
        scannerOverlay.style.justifyContent = 'center';
        scannerOverlay.style.alignItems = 'center';
        scannerOverlay.style.zIndex = '1000';

        const scannerContainer = document.createElement('div');
        scannerContainer.id = 'scanner-container';
        scannerContainer.style.position = 'relative';
        scannerContainer.style.width = '90%';
        scannerContainer.style.height = '90%';
        scannerContainer.style.backgroundColor = '#fff';
        scannerOverlay.appendChild(scannerContainer);

        // Add focus line
        const focusLine = document.createElement('div');
        focusLine.style.position = 'absolute';
        focusLine.style.left = '10%';
        focusLine.style.width = '80%';
        focusLine.style.height = '2px';
        focusLine.style.backgroundColor = 'rgba(255, 0, 0, 0.7)';
        focusLine.style.top = '10%';
        scannerContainer.appendChild(focusLine);

        // Animate focus line
        let direction = 1; // 1 for moving down, -1 for moving up
        const animationSpeed = 5; // Pixels per step
        const animationInterval = 30; // Time interval (ms)

        const animateFocusLine = () => {
            const currentTop = parseInt(focusLine.style.top || '10%', 10);
            const nextTop = currentTop + direction * animationSpeed;

            // Bounce the line when it reaches the container edges
            if (nextTop <= 10 || nextTop >= scannerContainer.offsetHeight - 10) {
                direction *= -1;
            }

            focusLine.style.top = `${nextTop}px`;
        };

        const animationId = setInterval(animateFocusLine, animationInterval);

        document.body.appendChild(scannerOverlay);

        // Initialize Quagga
        Quagga.init(
            {
                inputStream: {
                    name: 'Live',
                    type: 'LiveStream',
                    target: scannerContainer,
                    constraints: {
                        width: { min: 640, ideal: 1280, max: 1920 },
                        height: { min: 480, ideal: 720, max: 1080 },
                        facingMode: 'environment'
                    }
                },
                decoder: {
                    readers: ['code_128_reader']
                }
            },
            (err: any) => {
                if (err) {
                    console.error('Error initializing Quagga:', err);

                    if (err.name === 'NotAllowedError' || err.name === 'PermissionDeniedError') {
                        alert('Camera permission is required to scan barcodes.');
                    } else if (err.name === 'NotFoundError') {
                        alert('No camera detected on this device.');
                    } else {
                        alert('Error accessing the camera. Please try again.');
                    }

                    document.body.removeChild(scannerOverlay);
                    return;
                }
                Quagga.start();
            }
        );

        Quagga.onDetected((data: { codeResult: { code: any } }) => {
            const barcodeValue = data.codeResult.code;

            console.log('Barcode detected:', barcodeValue);

            // Stop the scanner and remove the overlay
            Quagga.stop();
            clearInterval(animationId); // Stop animation
            document.body.removeChild(scannerOverlay);

            // Use the barcode value
            this.setCustomer({
                id: '1',
                name: barcodeValue,
                full_address: 'Scanned Address',
                contact: 'Scanned Contact',
                balance: 0,
                order_details: []
            });
        });

        scannerOverlay.addEventListener('click', () => {
            Quagga.stop();
            clearInterval(animationId); // Stop animation
            document.body.removeChild(scannerOverlay);
        });
    };

    

    resetPos = (): void => {
        var settings = this.getAppSettings();
        this.setState({ products: [] });
        this.setState({ cart: [] });
        this.setState({ customers: [] });
        this.setState({ customer: undefined });
        this.setState({ customerName: null });
        this.setState({ customerEmail: null });
        this.setState({ customerMobile: null });
        this.setState({ customerCity: null });
        this.setState({ customerBuilding: null });
        this.setState({ customerStreet: null });
        this.setState({ customerFloor: null });
        this.setState({ customerApartment: null });
        this.setState({ bucketNumber: null });
        this.setState({ showProducts: false });
        this.setState({ categoryName: '' });
        this.setState({ subtotal: 0 });
        this.setState({ deliveryCharge: settings.deliveryCharge });
        this.setState({ total: 0 });
        this.setState({ discount: settings.discount });
        this.setState({ tax: settings.taxRate });
        this.setState({ vatType: settings.vatType });
        this.setState({ searchValue: null });
        this.setState({ remarks: null });
        this.setState({ tenderAmount: 0 });
        this.setState({ returnAmount: 0 });
        this.setState({ customerAmount: 0 });
        this.setState({ isLoading: false });
        this.setState({ selectItem: 'first' });
        this.setState({ isPaid: true });
        this.setState({ isQuotation: false });
        this.setState({bucketId: ''});
        this.setState({bucketName: ''});
        this.setState({bucketStock: 0});
        this.setState({bucketUnitPrice: 0});
        this.setState({bucketTotalPrice: 0});
        this.setState({ total_buckets: 0 });
        this.setState({ returnBucketTotalPrice: 0 });

        this.setState((prevState) => {
            const updatedReturnBucketInputs = Object.fromEntries(
              Object.entries(prevState.returnBucketInputs).map(([key, bucket]) => [
                key,
                { ...bucket, qty: 0, cost: 0 },
              ])
            );
            return { returnBucketInputs: updatedReturnBucketInputs };
        });

        this.setState((prevState) => {
            const updatedBucketInputs = Object.fromEntries(
              Object.entries(prevState.bucketInputs).map(([key, bucket]) => [
                key,
                { ...bucket, qty: 0, cost: 0 },
              ])
            );
            return { bucketInputs: updatedBucketInputs };
        });
    };

    togglePaidButton = (): void => {
        this.setState({ isPaid: !this.state.isPaid });
    };

    categoryClick = (category: ICategory): void => {
        this.setState({ showProducts: true });
        this.setState({ selectItem: category.id });
        this.setState({ products: category.products || [] });
        this.setState({ categoryName: category.name });
    };
    backClick = (): void => {
        this.setState({ showProducts: false });
        this.setState({ products: [] });
        this.setState({ categoryName: '' });
        this.setState({ selectItem: 'first' });
    };

    handleDiscountChange = (event: React.ChangeEvent<HTMLInputElement>): void => {
        var value = event.target.value;
        if (Number(value) < 0) return;
        var discountValue = value == '' ? undefined : Number(value);
        this.setState({ discount: discountValue }, () => {
            this.calculateTotal();
        });
    };

    handleTaxChange = (event: React.ChangeEvent<HTMLInputElement>): void => {
        var value = event.target.value;
        if (Number(value) < 0) return;
        var taxValue = value == '' ? undefined : Number(value);
        this.setState({ tax: taxValue }, () => {
            this.calculateTotal();
        });
    };
    handleDeliveryChargeChange = (event: React.ChangeEvent<HTMLInputElement>): void => {
        var value = event.target.value;
        if (Number(value) < 0) return;
        var deliveryChargeValue = value == '' ? undefined : Number(value);
        this.setState({ deliveryCharge: deliveryChargeValue }, () => {
            this.calculateTotal();
        });
    };

    updateItemPrice = (event: React.ChangeEvent<HTMLInputElement>, item: ICartItem): void => {
        var value = event.target.value;
        let cartItems = this.state.cart;
        let _prod = this.state.cart.find(p => p.cartId === item.cartId);
        if (!_prod) return;
        if (Number(value) < 0) return;
        _prod.price = value == '' ? undefined : Number(value);
        this.setState({ cart: cartItems }, () => {
            this.calculateTotal();
        });
    };
    updateItemQtyByClick = (event: any, item: ICartItem, qty: number): void => {
        var value = qty;
        let cartItems = this.state.cart;
        let _prod = this.state.cart.find(p => p.cartId === item.cartId);
        if (!_prod) return;
        if (Number(value) < 0) return;
        _prod.quantity = Number(value) || 1;
        this.setState({ cart: cartItems }, () => {
            this.calculateTotal();
        });
    };

    toggleFullScreen = (): void => {
        toogleFullScreen();
        this.setState({ isFullScreen: !this.state.isFullScreen });
    };
    goToDashboard = (): void => {
        window.location.href = '/';
    };

    calculateItemPrice = (item: ICartItem): number => {
        let price = ((item.price || 0) * (item.quantity || 0) * (100 - Number(item.discount || 0))) / 100.0;
        if (item.vat_type === 'add') price = price + (price * Number(item.tax_rate)) / 100;
        else price = price - (price * Number(item.tax_rate)) / 100;
        return Number(price.toFixed(2));
    };
    calculateTotal = (): void => {
        let _total: number = 0;
        let _subtotal: number = 0;
        let _discount: number = 0;
        let _bucket_total: number = 0;
        let _return_bucket_total: number = 0;

        const exchangeRate = this.state.currency === "USD" ? 1 : 1;

        if (this.state.bucketTotalPrice > 0 ) {
            _bucket_total = this.state.bucketTotalPrice;
        }

        if (this.state.returnBucketTotalPrice) {
            _return_bucket_total = this.state.returnBucketTotalPrice;
        }
        

        if (this.state.cart.length > 0) {
            this.state.cart.map((item: ICartItem) => {
                // console.log(item.retailsale_price);
                // console.log(item.wholesale_price);
                // _subtotal += (item.price || 0) * (item.quantity || 0);
                let item_discount = 0;
                item_discount = ((item.price || 0) * (item.quantity || 0) * (item.discount || 0)) / 100;
                _subtotal += ((item.price || 0) * (item.quantity || 0));
                _discount += item_discount;
                // _subtotal += ((this.state.currentPrice === 0 ? item.retailsale_price : item.wholesale_price) || 0) * (item.quantity || 0);

            });
        }

        let taxValue: number = 0;
        if (this.state.vatType == 'add') {
            if ((this.state.tax || 0) > 0 && (this.state.tax || 0) <= 100) {
                taxValue = (Number(this.state.tax || 0) * Number(_subtotal)) / 100;
            }
        }
        var deliveryCharge: number = 0;
        if (this.getAppSettings().enableTakeoutAndDelivery) {
            if (this.isOrderDelivery()) {
                deliveryCharge = Number(this.state.deliveryCharge || 0);
            }
        } else {
            deliveryCharge = Number(this.state.deliveryCharge || 0);
        }

        _total = (Number(_bucket_total) + Number(_subtotal) + Number(taxValue) + Number(deliveryCharge) - Number(_discount || 0) - Number(_return_bucket_total)) * exchangeRate;
       
        this.setState({
            subtotal: _subtotal * exchangeRate,
            total: _total,
            tenderAmount: _total,
            discount: _discount * exchangeRate
        });
    };

    getVat = (): number => {
        var vat = this.state.tax || 0;
        if (vat <= 0) return 0;
        var grossAmount = this.state.subtotal || 0;
        var taxAmount = this.getTaxAmount();
        return Math.round(Number(grossAmount) - Number(taxAmount));
    };

    getTaxAmount = (): number => {
        var vat = this.state.tax || 0;
        if (vat <= 0) return 0;
        var grossAmount = this.state.subtotal || 0;
        return Math.trunc(Number(grossAmount) / Number(Number(1) + Number(vat) / Number(100)));
    };

    getTotalTax = (): number => {
        let taxValue: number = 0;
        if (Number(this.state.tax || 0) > 0 && Number(this.state.tax || 0) <= 100) {
            taxValue = (Number(this.state.tax || 0) * Number(this.state.subtotal)) / 100;
        }
        return Number(taxValue);
    };
    getChangeAmount = (): number => {
        return (this.state.tenderAmount || 0) - this.state.total;
    };
    handleTenderAmountChange = (event: React.ChangeEvent<HTMLInputElement>): void => {
        var value = event.target.value;
        if (Number(value) < 0) return;
        var tenderAmount = value == '' ? undefined : Number(value);
        this.setState({ tenderAmount: tenderAmount });
    };
    handleCustomerAmountChange = (event: React.ChangeEvent<HTMLInputElement>): void => {
        var value = event.target.value;
        if (Number(value) < 0) return;
        var customerAmount = value == '' ? undefined : Number(value);
        this.setState({
            customerAmount,
            returnAmount: (!customerAmount ? 0 : customerAmount) - (!this.state.tenderAmount ? 0 : this.state.tenderAmount)
        });
    };
    handleRemarksChange = (event: React.FormEvent<HTMLTextAreaElement>): void => {
        this.setState({ remarks: event.currentTarget.value });
    };
    removeItem = (item: ICartItem): void => {
        let newCartItems = this.state.cart.filter(i => i.cartId != item.cartId);
        this.setState({ cart: newCartItems }, () => this.calculateTotal());
    };
    addToCart = (product: IProduct, price_type: number = this.state.currentPrice): void => {
        let _price: number | undefined;
        switch (price_type) {
            case 0:
                _price = product.unit_price;
                break;
            case 1:
                _price = product.box_price;
                break;
            case 2:
                _price = product.wholesale_price;
                break;
            case 3:
                _price = product.price_per_gram;
                break;
            case 4:
                _price = product.price_per_kilogram;
                break;
            default:
                _price = product.unit_price;
                return;
        }
        let cartItem: ICartItem = {
            cartId: uuid(),
            id: product.id,
            name: product.name,
            full_name: product.full_name,
            image_url: product.image_url,
            price: _price,
            box_price: product.box_price,
            unit_price: product.unit_price,
            wholesale_price: product.wholesale_price,
            price_per_gram: product.price_per_gram,
            price_per_kilogram: product.price_per_kilogram,
            // barcode: product.barcode,
            box_barcode: product.box_barcode,
            unit_barcode: product.unit_barcode,
            superdealer_barcode: product.superdealer_barcode,
            wholesale_barcode: product.wholesale_barcode,
            pricepergram_barcode: product.pricepergram_barcode,
            priceperkilogram_barcode: product.priceperkilogram_barcode,
            // sku: product.sku,
            box_sku: product.box_sku,
            unit_sku: product.unit_sku,
            superdealer_sku: product.superdealer_sku,
            wholesale_sku: product.wholesale_sku,
            pricepergram_sku: product.unit_sku,
            priceperkilogram_sku: product.unit_sku,
            in_stock: product.in_stock,
            track_stock: product.track_stock,
            continue_selling_when_out_of_stock: product.continue_selling_when_out_of_stock,
            quantity: 1,
            vat_type: this.getAppSettings().vatType,
            tax_rate: 0,
            discount: 0,
            count_per_box: product.count_per_box,
            cost_unit: product.cost_unit,
            box_unit: product.box_unit,
            expiry_date: product.expiry_date,
            price_type: price_type,
            number_of_buckets : product.number_of_buckets ? product.number_of_buckets : 0,
            minimum_stock : product.minimum_stock ? product.minimum_stock : 0,
        };

        this.setState({ selectItem: 'first' });

        this.setState({ cart: [cartItem, ...this.state.cart] }, () => {
            this.calculateTotal();
        });
        if (this.state.hasaudio) {
            new Audio('/audio/public_audio_ding.mp3').play();
        }
    };

    handleSearchSubmit = (event: React.FormEvent<HTMLFormElement>): void => {
        event.preventDefault();
        let search = this.state.searchValue;
        if (!search) return;
        let searchValue = search.toLowerCase().trim();
        let productFound = false;
        let price_type: number;
        this.state.categories.map((category: ICategory) => {
            let _prod;
            for (let index = 0; index < 3; index++) {
                switch (index) {
                    case 0:
                        _prod = category.products.find(
                            p =>
                                p.name.toLowerCase().includes(searchValue) ||
                                p?.unit_barcode?.toLowerCase() == searchValue ||
                                p?.unit_sku?.toLowerCase() == searchValue
                            // || p?.barcode?.toLowerCase() == searchValue || p?.sku?.toLowerCase() == searchValue
                        );
                        break;
                    case 1:
                        _prod = category.products.find(
                            p =>
                                p.name.toLowerCase().includes(searchValue) ||
                                p?.box_barcode?.toLowerCase() == searchValue ||
                                p?.box_sku?.toLowerCase() == searchValue
                            // || p?.barcode?.toLowerCase() == searchValue || p?.sku?.toLowerCase() == searchValue
                        );
                        break;
                    case 2:
                        _prod = category.products.find(
                            p =>
                                p.name.toLowerCase().includes(searchValue) ||
                                p?.wholesale_barcode?.toLowerCase() == searchValue ||
                                p?.wholesale_sku?.toLowerCase() == searchValue
                            // || p?.barcode?.toLowerCase() == searchValue || p?.sku?.toLowerCase() == searchValue
                        );
                        break;
                    default:
                        // _prod = category.products.find(
                        //     p => p.name.toLowerCase().includes(searchValue) || p?.barcode?.toLowerCase() == searchValue || p?.sku?.toLowerCase() == searchValue
                        // );
                        return;
                }

                if (_prod) {
                    price_type = index;
                    break;
                }
            }

            // for (let i = 0; i < this.state.cart.length; i++) {
            //     if (_prod !== undefined && _prod.id === this.state.cart[i].id) {
            //         _prod = undefined;
            //         break;
            //     }
            // }

            if (_prod) {
                this.addToCart(_prod, price_type);
                productFound = true;
                if (productFound) {
                    this.setState({ searchValue: null });
                    var searchInput: any = document.getElementById('barcode-input');
                    if (searchInput) {
                        searchInput.value = '';
                    }
                }

                return;
            }
        });
        if (!productFound) {
            toast.error(t('No results found!', 'لم يتم العثور على نتائج!'));
        }
    };
    handleSearchChange = (event: React.FormEvent<HTMLInputElement>): void => {
        this.setState({ searchValue: event.currentTarget.value });
    };

    handleVatTypeChange = (event: any): void => {
        this.setState({ vatType: event.target.value }, () => {
            this.calculateTotal();
        });
    };

    handleSelectItem = (e: React.FormEvent<HTMLSelectElement>): void => {
        console.log(e.currentTarget.value);
        let categoryTemp: ICategory | undefined = this.state.categories.find(category => category.id === e.currentTarget.value);
        if (categoryTemp?.id) {
            this.categoryClick(categoryTemp);
        }
    };

    handleCustomerSearchChange = (event: React.FormEvent<HTMLInputElement>): void => {
        var searchQuery = event.currentTarget.value.trim();
        if (!searchQuery) {
            this.setState({ customers: [] });
            return;
        }
        httpService
            .get(`/customers/search/all?query=${searchQuery}`)
            .then((response: any) => {
                this.setState({ customers: response.data.data });
            })
            .finally(() => {});
    };

    setCustomer = (customer: ICustomer): void => {
        this.setState({ customer: customer });
    };

    selectCustomer(customer: ICustomer) {
        this.setState({ customer: customer });
        this.closeModal('customerModal');
    }

    closeModal = (id: string): void => {
        const createModal = document.querySelector(`#${id}`);
        if (createModal) {
            var modalInstance = Modal.getInstance(createModal);
            if (modalInstance) {
                modalInstance.hide();
            }
        }
    };
    getAppSettings = (): any => {
        return JSON.parse(this.props.settings);
    };

    currencyFormatValue = (number: any): any => {
        var settings = this.getAppSettings();
        return currency_format(
            number,
            settings.currencyPrecision,
            settings.currencyDecimalSeparator,
            settings.currencyThousandSeparator,
            settings.currencyPosition,
            settings.currencySymbol,
            settings.trailingZeros
        );
    };

    receiptExchangeRate = (): any => {
        var settings = this.getAppSettings();
        var value = Number(this.state.total) * Number(settings.exchangeRate);
        return currency_format(value, 2, '.', ',', 'before', settings.exchangeCurrency, true);
    };

    removeCustomer() {
        this.setState({ customer: undefined });
    }
    isProductAvailable = (product: IProduct): boolean => {
        if (product.continue_selling_when_out_of_stock) return true;
        if(product.in_stock < Number(product.minimum_stock)) return false;
        if (!product.track_stock) return true;
        if (product.in_stock > 0) return true;
        return false;
    };
    updateItemQuantity = (event: React.ChangeEvent<HTMLInputElement>, item: ICartItem): void => {
        var value = event.target.value;
        let cartItems = this.state.cart;
        let _prod = this.state.cart.find(p => p.cartId === item.cartId);
        if (!_prod) return;
        if (Number(value) < 0) return;
        _prod.quantity = value == '' ? undefined : Number(value);
        this.setState({ cart: cartItems }, () => {
            this.calculateTotal();
        });
    };

    updateItemPriceType = (event: React.ChangeEvent<HTMLSelectElement>, item: ICartItem): void => {
        var value = event.target.value;
        let cartItems = this.state.cart;
        let _prod = this.state.cart.find(p => p.cartId === item.cartId);
        if (!_prod) return;
        if (Number(value) < 0) return;
        _prod.price_type = value == '' ? 0 : Number(value);
        let _price: number | undefined;
        switch (_prod.price_type) {
            case 0:
                _price = item.unit_price;
                break;
            case 1:
                _price = item.box_price;
                break;
            case 2:
                _price = item.wholesale_price;
                break;
            case 3:
                _price = item.price_per_gram;
                break;
            case 4:
                _price = item.price_per_kilogram;
                break;
            default:
                _price = item.unit_price;
                return;
        }
        _prod.price = _price;
        this.setState({ cart: cartItems }, () => {
            this.calculateTotal();
        });
    };

    updateItemVatType = (item: ICartItem): void => {
        let cartItems = this.state.cart;
        let _prod = this.state.cart.find(p => p.cartId === item.cartId);
        if (!_prod) return;
        _prod.vat_type = item.vat_type === 'exclude' ? 'add' : 'exclude';
        this.setState({ cart: cartItems }, () => {
            this.calculateTotal();
        });
    };

    updateItemVAT = (event: React.ChangeEvent<HTMLInputElement>, item: ICartItem): void => {
        var value = event.target.value;
        let cartItems = this.state.cart;
        let _prod = this.state.cart.find(p => p.cartId === item.cartId);
        if (!_prod) return;
        if (Number(value) < 0) return;
        _prod.tax_rate = value == '' ? undefined : Number(value);
        this.setState({ cart: cartItems }, () => {
            this.calculateTotal();
        });
    };

    updateItemDiscount = (event: React.ChangeEvent<HTMLInputElement>, item: ICartItem): void => {
        var value = event.target.value;
        let cartItems = this.state.cart;
        let _prod = this.state.cart.find(p => p.cartId === item.cartId);
        if (!_prod) return;
        if (Number(value) < 0) return;
        _prod.discount = value == '' ? undefined : Number(value);
        this.setState({ cart: cartItems }, () => {
            this.calculateTotal();
        });
    };

    createCustomer = (e: React.FormEvent<HTMLFormElement>): void => {
        e.preventDefault();
        if (!this.state.customerName) {
            toast.error(t('Customer name is required!', 'اسم الزبون مطلوب!'));
            return;
        }

        const transformedPlasticBucketStock = Object.entries(this.state.plastic_bucket_stock).reduce(
            (acc, [bucketId, bucket]) => {
                acc[bucketId] = bucket.stock.toString();
                return acc;
            },
            {} as { [key: string]: string }
        );

        this.setState({ isLoading: true });
        httpService
            .post(`/customers/create-new`, {
                name: this.state.customerName,
                email: this.state.customerEmail,
                mobile: this.state.customerMobile,
                city: this.state.customerCity,
                building: this.state.customerBuilding,
                street_address: this.state.customerStreet,
                floor: this.state.customerFloor,
                apartment: this.state.customerApartment,
                // available_buckets: this.state.bucketNumber,
                plastic_bucket_stock: transformedPlasticBucketStock
            })
            .then((response: any) => {
                console.log(this.state.plastic_bucket_stock);
                console.log(response.data);
                this.setCustomer(response.data.data);
                this.setState({ customerName: '' });
                this.setState({ customerEmail: '' });
                this.setState({ customerMobile: '' });
                this.setState({ customerBuilding: '' });
                this.setState({ customerStreet: '' });
                this.setState({ customerFloor: '' });
                this.setState({ customerApartment: '' });
                // this.setState({bucketNumber : ''});
                this.setState((prevState) => {
                    const updatedCustomerBuckets = Object.fromEntries(
                        Object.entries(prevState.plastic_bucket_stock).map(([bucketId, bucket]) => [
                        bucketId,
                        { ...bucket, stock: 0 },
                        ])
                    );
                    return { plastic_bucket_stock: updatedCustomerBuckets };
                });
                
                var form = document.getElementById('create-customer-form') as HTMLFormElement;
                if (form) {
                    form.reset();
                }
                this.closeModal('customerModal');
                toast.info(t('Customer has been created', 'تم إنشاء زبون جديد'));
            })
            .finally(() => {
                this.setState({ isLoading: false });
            });
    };

    handleCustomerNameChange = (event: React.FormEvent<HTMLInputElement>): void => {
        this.setState({ customerName: event.currentTarget.value });
    };
    handleCustomerEmailChange = (event: React.FormEvent<HTMLInputElement>): void => {
        this.setState({ customerEmail: event.currentTarget.value });
    };
    handleCustomerMobileChange = (event: React.FormEvent<HTMLInputElement>): void => {
        this.setState({ customerMobile: event.currentTarget.value });
    };
    handleCustomerCityChange = (event: React.FormEvent<HTMLInputElement>): void => {
        this.setState({ customerCity: event.currentTarget.value });
    };
    handleCustomerStreetChange = (event: React.FormEvent<HTMLInputElement>): void => {
        this.setState({ customerStreet: event.currentTarget.value });
    };
    handleCustomerBuildingChange = (event: React.FormEvent<HTMLInputElement>): void => {
        this.setState({ customerBuilding: event.currentTarget.value });
    };
    handleCustomerFloorChange = (event: React.FormEvent<HTMLInputElement>): void => {
        this.setState({ customerFloor: event.currentTarget.value });
    };
    handleCustomerApartmentChange = (event: React.FormEvent<HTMLInputElement>): void => {
        this.setState({ customerApartment: event.currentTarget.value });
    };
    handleCustomerBucketChange = (event: React.FormEvent<HTMLInputElement>): void => {
        this.setState({ bucketNumber: event.currentTarget.value });
    };

    printInvoice = (data: any, settings: any): void => {
        var receipt = window.open(``, 'PRINT', 'height=600,width=300');
        var order = data.order;
        var barcode = data.barcode;
        if (!receipt) return;
        receipt.document.write(`<html lang="${settings.lang}" dir="${settings.dir}"><head><title>Order Receipt ${order.number}</title></head><body>`);

        receipt.document.write(`<div style="margin-bottom: 1.0rem;text-align: center !important;">`);
        if (settings.storeName) {
            receipt.document.write(`<div style="font-size: 1.50rem;">${settings.storeName}</div>`);
        }
        if (settings.storeAddress) {
            receipt.document.write(`<div style="font-size: 0.875rem;">${settings.storeAddress}</div>`);
        }
        if (settings.storePhone) {
            receipt.document.write(`<div style="font-size: 0.875rem;">${settings.storePhone}</div>`);
        }
        if (settings.storeWebsite) {
            receipt.document.write(`<div style="font-size: 0.675em;">${settings.storeWebsite}</div>`);
        }
        if (settings.storeEmail) {
            receipt.document.write(`<div style="font-size: 0.675em;">${settings.storeEmail}</div>`);
        }
        receipt.document.write(`</div>`);

        receipt.document.write('<div style="margin-bottom: 1.0rem">');
        order.order_details.map((detail: any) => {
            let unit = detail.price_type == 1 ? detail.product.box_unit : detail.product.cost_unit;
            if (receipt) {
                receipt.document.write(`<div>`);
                receipt.document.write(`<div>${detail.product.name}</div>`);
                receipt.document.write(`<div style="display: flex">`);
                receipt.document.write(`<div>${detail.quantity} (${unit}) * ${detail.view_price}</div>`);
                receipt.document.write(`<div style="${settings.margin}: auto">${detail.view_total}</div>`);
                receipt.document.write('</div>');
                receipt.document.write('</div>');
            }
        });
        receipt.document.write('</div>');

        if (order.discount > 0) {
            receipt.document.write('<div style="display: flex">');
            receipt.document.write(`<div>${t('Discount', 'الخصم')}</div>`);
            receipt.document.write(`<div style="${settings.margin}: auto">${order.discount_view}</div>`);
            receipt.document.write('</div>');
        }
        if (this.getAppSettings().enableTakeoutAndDelivery) {
            if (this.isOrderDelivery()) {
                if (order.delivery_charge > 0) {
                    receipt.document.write('<div style="display: flex">');
                    receipt.document.write(`<div>${t('Delivery Charge', 'رسوم التوصيل')}:</div>`);
                    receipt.document.write(`<div style="${settings.margin}: auto">${order.delivery_charge_view}</div>`);
                    receipt.document.write('</div>');
                }
            }
        } else {
            if (order.delivery_charge > 0) {
                receipt.document.write('<div style="display: flex">');
                receipt.document.write(`<div>${t('Delivery Charge', 'رسوم التوصيل')}:</div>`);
                receipt.document.write(`<div style="${settings.margin}: auto">${order.delivery_charge_view}</div>`);
                receipt.document.write('</div>');
            }
        }

        if (order.tax_rate > 0) {
            if (order.vat_type == 'add') {
                receipt.document.write('<div style="display: flex;">');
                receipt.document.write(`<div>${t('VAT', 'الضريبة')} (${order.tax_rate}%):</div>`);
                receipt.document.write(`<div style="${settings.margin}: auto">${order.total_tax_view}</div>`);
                receipt.document.write('</div>');
            } else {
                receipt.document.write('<div style="display: flex;">');
                receipt.document.write(`<div>${t('Subtotal', 'المجموع')}</div>`);
                receipt.document.write(`<div style="${settings.margin}: auto">${order.subtotal_view}</div>`);
                receipt.document.write('</div>');
                receipt.document.write('<div style="display: flex;">');
                receipt.document.write(`<div>${t('TAX.AMOUNT', 'قيمة الضريبة')}</div>`);
                receipt.document.write(`<div style="${settings.margin}: auto">${order.tax_amount_view}</div>`);
                receipt.document.write('</div>');
                receipt.document.write('<div style="display: flex;">');
                receipt.document.write(`<div>${t('VAT', 'الضريبة')} ${order.tax_rate}%:</div>`);
                receipt.document.write(`<div style="${settings.margin}: auto">${order.vat_view}</div>`);
                receipt.document.write('</div>');
            }
        }
        receipt.document.write(`<div style="font-weight:700;">${t('Plastic Buckets Sold', 'دلو بلاستيك')}</div>`);
        if (order.plastic_bucket_stock) {
            Object.values(order.plastic_bucket_stock).forEach((bucket:any) => {
                if (receipt && bucket.qty > 0) {
                    receipt.document.write('<div style="display: flex">');
                    receipt.document.write(`<div>${bucket.category_name} - (${bucket.qty} *  ${bucket.cost})</div>`);
                    receipt.document.write(`<div style="${settings.margin}: auto">${this.currencyFormatValue(bucket.qty * bucket.cost)}</div>`);
                    receipt.document.write('</div>');
                }
            });
        }

        receipt.document.write('<div style="display: flex">');
        receipt.document.write(`<div>${t('Total', 'المجموع')}</div>`);
        receipt.document.write(`<div style="${settings.margin}: auto; font-weight:700;">${this.currencyFormatValue(order.bucketTotalPrice)}</div></div>`);

        receipt.document.write('<hr/>');

        receipt.document.write(`<div style="font-weight:700;">${t('Plastic Buckets Returned', 'دلاء بلاستيكية تم إرجاعها')}</div>`);
        if (order.returned_plastic_bucket_stock) {
            Object.values(order.returned_plastic_bucket_stock).forEach((bucket:any) => {
                if (receipt && bucket.qty > 0) {
                    receipt.document.write('<div style="display: flex">');
                    receipt.document.write(`<div>${bucket.category_name} - (${bucket.qty} *  ${bucket.cost})</div>`);
                    receipt.document.write(`<div style="${settings.margin}: auto">${this.currencyFormatValue(bucket.qty * bucket.cost)}</div>`);
                    receipt.document.write('</div>');
                }
            });
        }

        receipt.document.write('<div style="display: flex">');
        receipt.document.write(`<div>${t('Total', 'المجموع')}</div>`);
        receipt.document.write(`<div style="${settings.margin}: auto; font-weight:700;">${this.currencyFormatValue(order.returnBucketTotalPrice)}</div></div>`);

        receipt.document.write('<hr/>');

        receipt.document.write('<div style="font-weight: 700">');
        receipt.document.write(`<div>${t('Total', 'المجموع')}</div>`);
        receipt.document.write(`<div style="display: flex;">`);
        receipt.document.write(`<div style="${settings.margin}: auto">${order.total_view}</div>`);
        receipt.document.write('</div>');
        receipt.document.write(`<div style="display: flex;">`);
        receipt.document.write(`<div style="${settings.margin}: auto">${order.receipt_exchange_rate}</div>`);
        receipt.document.write('</div>');
        receipt.document.write('</div>');

        receipt.document.write('<div style="text-align: center !important;margin-bottom: 0.5rem !important;">');
        receipt.document.write(`<span style="margin-right: 1rem">${order.date_view}</span> <span>${order.time_view}</span>`);
        receipt.document.write('</div>');
        receipt.document.write(`<div style="text-align: center !important;margin-bottom: 0.5rem !important;">${order.number}</div>`);

        receipt.document.write(`<div style="display: flex;align-items: center !important;justify-content: center">${barcode}</div>`);

        if (settings.storeAdditionalInfo) {
            receipt.document.write(
                `<div style="font-size: 0.875em;text-align: center !important;margin-bottom: 0.5rem !important;">${settings.storeAdditionalInfo}</div>`
            );
        }
        receipt.document.write('</body></html>');
        receipt.document.close();
        receipt.focus();
        receipt.print();
        receipt.close();
    };

    modalCloseButton = (): React.ReactNode => {
        return <button type="button" className="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>;
    };
    modalCloseButtonWhite = (): React.ReactNode => {
        return <button type="button" className="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>;
    };

    handleOrderTypeChange = (event: React.ChangeEvent<HTMLSelectElement>): void => {
        this.setState({ orderType: event.target.value }, () => {
            this.calculateTotal();
        });
    };

    isOrderDelivery = (): boolean => {
        return this.state.orderType == 'delivery';
    };

    allProducts = (): IProduct[] => {
        var products: IProduct[] = [];
        this.state.categories.map((category: ICategory) => {
            category.products.map((product: IProduct) => {
                products.push(product);
            });
        });

        return products;
    };

    handleCloseModal = (): void => {
        this.closeModal('checkoutModal');
    };

    handleIsSalesmanChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
        // Handle the change event
        const selectedSalesmanId = e.target.value; // Get the selected salesman's ID
        const selectedSalesman = this.state.salesmen.find(salesman => String(salesman.id) === selectedSalesmanId); // Find the salesman object from the state
        this.setState({ selectedSalesmanId, selectedSalesman });
    };

    handleCurrencyChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
        const selectedCurrency = e.target.value;
        this.setState({ currency: selectedCurrency }, () => {
            this.calculateTotal();
        });
    };

    handleIsRootChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
        // Handle the change event
        const selectedRootId = e.target.value; // Get the selected salesman's ID
        const selectedRoot = this.state.roots.find(root => String(root.id) === selectedRootId); // Find the salesman object from the state
        this.setState({ selectedRootId, selectedRoot });
    };

    handleIsLineChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
        // Handle the change event
        const selectedLineId = e.target.value; // Get the selected salesman's ID
        const selectedLine = this.state.lines.find(line => String(line.id) === selectedLineId); // Find the salesman object from the state
        this.setState({ selectedLineId, selectedLine });
    };

    handleIsQuotationChange = (event: React.ChangeEvent<HTMLSelectElement>): void => {
        this.setState({
            isQuotation: event.target.value == 'Quotation'
        });
    };

    handleBucketIdChange = (event: React.ChangeEvent<HTMLSelectElement>): void => {
        const selectedBucketId = event.target.value;
        const bktName = this.state.buckets.find(bkt => String(bkt.id) === selectedBucketId) ;


        this.setState({
            bucketId: selectedBucketId
        });
        this.setState({
            bucketName: bktName?.category_name ?? ""
        });
    };

    removeBucket() {
        this.setState({ bucketId: '' });
        this.setState({ bucketName: '' });
        this.setState({ bucketStock: 0 });
        this.setState({ bucketUnitPrice: 0 });
        this.setState({ bucketTotalPrice: 0 }, () => {
            this.calculateTotal();
        });
    }


    handlebucketStock = (event: React.ChangeEvent<HTMLInputElement>): void => {
        const selectedBucketId = event.target.value;
        let _bt: number = Number(selectedBucketId) * this.state.bucketUnitPrice;

        this.setState({
            bucketStock: Number(selectedBucketId) ?? 0
        });

        this.setState({bucketTotalPrice: _bt}, () => {
            this.calculateTotal();
        });
    };

    handleBucketUnitPrice = (event: React.ChangeEvent<HTMLInputElement>): void => {
        const selectedBucketId = event.target.value;
        let _bt: number = Number(selectedBucketId) * this.state.bucketStock;

        this.setState({
            bucketUnitPrice: Number(selectedBucketId) ?? 0
        });

        this.setState({bucketTotalPrice: _bt}, () => {
            this.calculateTotal();
        });
    };



    pricesFilter = (): React.ReactNode => {
        return (
            <div className="dropdown">
                <button
                    type="button"
                    className="nav-link bg-white border px-3 py-2 rounded-3 clickable-cell"
                    data-bs-toggle="modal"
                    data-bs-target="#myModal">
                    <div className="d-flex align-items-center">
                        <div className="d-flex justify-content-between align-items-center">
                            <div className="me-5">{priceFilterList[this.state.currentPrice]}</div>
                            <ChevronDownIcon className="hero-icon-xs" />
                        </div>
                    </div>
                </button>
            </div>
        );
    };

    handleSelectRadio = (index: number): void => {
        this.setState({ currentPrice: index }, () => {
            this.calculateTotal();
        });
        this.closeModal('myModal');
    };

    pricesFilterModal = (): React.ReactNode => {
        return (
            <div className="modal zoom-out-entrance" id="myModal" tabIndex={-1} aria-labelledby="myModalLabel" aria-hidden="true">
                <div className="modal-dialog modal-dialog-centered">
                    <div className="modal-content">
                        {priceFilterList.map((item, index) => {
                            return (
                                <div className="modal-header">
                                    <div
                                        className="d-flex justify-content-between w-100 user-select-none cursor-pointer"
                                        onClick={() => this.handleSelectRadio(index)}>
                                        <div>{item}</div>
                                        <input type="radio" checked={this.state.currentPrice === index} />
                                    </div>
                                </div>
                            );
                        })}
                    </div>
                </div>
            </div>
        );
    };

    render(): JSX.Element {
        const { selectedSalesmanId, selectedSalesman, selectedRootId, selectedRoot, selectedLineId, selectedLine } = this.state;
        const overallTotal = this.state.buckets.reduce((acc, bucket) => {
            const { qty = 0, cost = 0 } = this.state.bucketInputs[bucket.id] || {};
            return acc + ((qty || 0) * (cost || 0));
        }, 0);


        const returnOverallTotal = this.state.buckets.reduce((acc, bucket) => {
            const { qty = 0, cost = 0 } = this.state.returnBucketInputs[bucket.id] || {};
            return acc + ((qty || 0) * (cost || 0));
        }, 0);

        // console.log(this.state.bucketInputs);

        return (
            <React.Fragment>
                <div className="d-flex py-3">
                    <div className="d-flex flex-grow-1">
                        <div className="flex-grow-1 d-flex">
                            <button className="btn btn-primary me-2" onClick={event => this.goToDashboard()}>
                                <span className="d-flex align-items-center">
                                    <Squares2X2Icon className="hero-icon me-1" /> {t('Dashboard', 'الرئيسية')}
                                </span>
                            </button>
                            <button className="btn btn-light me-3 bg-white border" data-bs-toggle="modal" data-bs-target="#customerModal">
                                <span className="d-flex align-items-center">
                                    <UserCircleIcon className="hero-icon me-1" /> {t('Customer', 'الزبون')}
                                </span>
                            </button>
                            <button className="btn btn-primary me-5" onClick={event => this.scan_barcode()}>
                                Scan Barcode
                            </button>
                            <button className="btn btn-danger me-5" onClick={event => this.reset()}>
                                <span className="d-flex align-items-center">
                                    <ArrowPathIcon className="hero-icon me-1" /> {t('Reset?', 'إعادة ضبط')}
                                </span>
                            </button>
                            
                            {/* <select
                                name="bucketId"
                                id="bucketId"
                                value={this.state.bucketId}
                                className="form-select me-3"
                                onChange={e => this.handleBucketIdChange(e)}
                                >
                                <option value="" disabled>
                                    Select Plastic Bucket
                                </option>
                                {this.state.buckets.map(bucket => (
                                    <option key={bucket.id} value={bucket.id}>
                                        {bucket.category_name} - (Stock:{bucket.stock})
                                    </option>
                                ))}
                            </select> */}

                            <select
                                name="is_quotation"
                                id="is_quotation"
                                className="form-select me-3"
                                defaultValue="Invoice"
                                onChange={e => this.handleIsQuotationChange(e)}>
                                <option value="Inovoice">{t('Invoice', 'فاتورة')}</option>
                                <option value="Quotation">{t('Quotation', 'اقتباس')}</option>
                            </select>

                            <select
                                name="salesman"
                                id="salesman"
                                value={selectedSalesmanId}
                                className="form-select me-3"
                                onChange={this.handleIsSalesmanChange}>
                                <option value="" disabled>
                                    Select Salesman
                                </option>
                                {this.state.salesmen.map(salesman => (
                                    <option key={salesman.id} value={salesman.id}>
                                        {salesman.salesman_name}
                                    </option>
                                ))}
                            </select>

                            <select name="roots" id="roots" value={selectedRootId} className="form-select me-3" onChange={this.handleIsRootChange}>
                                <option value="" disabled>
                                    Select Root
                                </option>
                                {this.state.roots.map(root => (
                                    <option key={root.id} value={root.id}>
                                        {root.root_name}
                                    </option>
                                ))}
                            </select>

                            <select name="lines" id="lines" value={selectedLineId} className="form-select me-3" onChange={this.handleIsLineChange}>
                                <option value="" disabled>
                                    Select Line
                                </option>
                                {this.state.lines.map(line => (
                                    <option key={line.id} value={line.id}>
                                        {line.location}
                                    </option>
                                ))}
                            </select>


                            <select
                                name="currency"
                                id="currency"
                                value={this.state.currency}
                                className="form-select me-3"
                                onChange={this.handleCurrencyChange}>
                                <option value="" disabled>
                                    Select Currency
                                </option>
                                {currencyFilterList.map(currency => (
                                    <option key={currency} value={currency}>
                                        {currency}
                                    </option>
                                ))}
                            </select>

                        </div>
                        {this.pricesFilter()}
                        {this.pricesFilterModal()}
                    </div>
                    <div className="d-flex">
                        {this.getAppSettings().enableTakeoutAndDelivery && (
                            <select
                                name="order-type"
                                id="order-type"
                                className="form-select form-select-lg px-5"
                                defaultValue="takeout"
                                onChange={e => this.handleOrderTypeChange(e)}>
                                <option value="takeout">{t('Takeout', 'أستلام')}</option>
                                <option value="delivery">{t('Delivery', 'توصيل')}</option>
                            </select>
                        )}
                    </div>
                </div>
                <div className="row">
                    <div className="col-md-8">
                        <div className="card w-100 card-gutter rounded-0">
                            <div className="card-header bg-white border-bottom-0 p-0">
                                <form onSubmit={event => this.handleSearchSubmit(event)}>
                                    <input
                                        type="search"
                                        className="form-control form-control-lg rounded-0"
                                        name="search"
                                        id="barcode-input"
                                        placeholder={t('Scannn barcode or search by name or SKU', 'امسح الباركود ضوئيًا أو ابحث بالاسم أو SKU')}
                                        onChange={event => this.handleSearchChange(event)}
                                    />
                                </form>
                                <table className="table table-bordered mb-0">
                                    <thead>
                                        <tr>
                                            <td width={400} className="p-3 fw-bold">
                                                {t('Item', 'الصنف')}
                                            </td>
                                            <td width={150} className="text-center p-3 fw-bold">
                                                {t('Price Type', 'نوع السعر')}
                                            </td>
                                            <td width={150} className="text-center p-3 fw-bold">
                                                {t('Quantity', 'الكمية')}
                                            </td>

                                            {/* <td width={150} className="text-center p-3 fw-bold">
                                                {t('SalesMan', 'الكمية')}
                                            </td>
                                            <td width={150} className="text-center p-3 fw-bold">
                                                {t('Root', 'الكمية')}
                                            </td>
                                            <td width={150} className="text-center p-3 fw-bold">
                                                {t('Line', 'الكمية')}
                                            </td> */}
                                            <td width={150} className="text-center p-3 fw-bold">
                                                {t('VAT', 'الضريبة')} %
                                            </td>
                                            <td width={150} className="text-center p-3 fw-bold">
                                                {t('Discount', 'الخصم')} %
                                            </td>
                                            <td width={150} className="text-center p-3 fw-bold">
                                                {t('Total', 'المجموع')}
                                            </td>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            <div className="card-body p-0 overflow-auto" id="cartItems">
                                <table className="table table-bordered mb-0" style={tableStyles}>
                                    <tbody>
                                        {this.state.cart.length > 0 ? (
                                            <React.Fragment>
                                                {this.state.cart.map((item: ICartItem) => {
                                                    return (
                                                        <tr key={item.cartId}>
                                                            {/* Item Column */}
                                                            <td className="align-middle">
                                                                <div className="d-flex align-items-center">
                                                                    <img src={item.image_url} alt="item" className="rounded-2" height={50} />
                                                                    <div className="ms-2">
                                                                        <div className="fw-bold">{this.state.categoryName} - {item.full_name}</div>
                                                                        <div className="fw-normal">
                                                                            <input
                                                                                type="number"
                                                                                className="form-control text-center"
                                                                                value={item.price}
                                                                                onFocus={e => e.target.select()}
                                                                                onChange={e => this.updateItemPrice(e, item)}
                                                                            />
                                                                        </div>
                                                                    </div>
                                                                    <div className="me-auto d-flex align-items-center">
                                                                        <XCircleIcon
                                                                            className="hero-icon-sm align-middle text-danger cursor-pointer user-select-none"
                                                                            onClick={event => this.removeItem(item)}
                                                                        />
                                                                    </div>
                                                                </div>
                                                            </td>
                                
                                                            {/* Price Type Column */}
                                                            <td className="align-middle">
                                                                <select
                                                                    className="form-control text-center"
                                                                    onChange={event => this.updateItemPriceType(event, item)}>
                                                                    {priceFilterList.map((priceItem, index) => (
                                                                        <option value={index} selected={index === item.price_type}>
                                                                            {priceItem}
                                                                        </option>
                                                                    ))}
                                                                </select>
                                                            </td>
                                
                                                            {/* Quantity Column */}
                                                            <td className="align-middle">
                                                                <input
                                                                    type="number"
                                                                    className="form-control text-center fw-bold form-control-lg"
                                                                    value={item.quantity}
                                                                    onFocus={e => e.target.select()}
                                                                    onChange={event => this.updateItemQuantity(event, item)}
                                                                />
                                                            </td>

                                                            {/* Bucket Column */}
                                                            {/* <td className="align-middle">
                                                                Buckets: 
                                                                <input
                                                                    type="number"
                                                                    className="form-control text-center fw-bold form-control-lg"
                                                                    value={item.number_of_buckets? item.number_of_buckets : 0}
                                                                    onFocus={e => e.target.select()}
                                                                    onChange={event => this.updateItemBucketNumber(event, item)}
                                                                    required
                                                                />
                                                            </td> */}
                                
                                                            {/* Salesman Column */}
                                                            {/* <td className="align-middle">
                                                                {selectedSalesman?.salesman_name}
                                                            </td> */}
                                
                                                            {/* Root Column */}
                                                            {/* <td className="align-middle">
                                                                {selectedRoot?.root_name}
                                                            </td> */}
                                
                                                            {/* Line Column */}
                                                            {/* <td className="align-middle">
                                                                {selectedLine?.location}
                                                            </td> */}
                                
                                                            {/* VAT Column */}
                                                            <td className="align-middle">
                                                                <div onClick={event => this.updateItemVatType(item)}>{item.vat_type}</div>
                                                                <input
                                                                    type="number"
                                                                    className="form-control text-center fw-bold form-control-lg"
                                                                    value={item.tax_rate}
                                                                    onFocus={e => e.target.select()}
                                                                    onChange={event => this.updateItemVAT(event, item)}
                                                                />
                                                            </td>
                                
                                                            {/* Discount Column */}
                                                            <td className="align-middle">
                                                                <input
                                                                    type="number"
                                                                    className="form-control text-center fw-bold form-control-lg"
                                                                    value={item.discount}
                                                                    onFocus={e => e.target.select()}
                                                                    onChange={event => this.updateItemDiscount(event, item)}
                                                                />
                                                            </td>
                                
                                                            {/* Total Price Column */}
                                                            <td className="text-center align-middle">
                                                                {this.calculateItemPrice(item)}
                                                            </td>
                                                        </tr>
                                                    );
                                                })}
                                            </React.Fragment>
                                        ) : (
                                            <React.Fragment>
                                                <tr>
                                                    <td colSpan={9} className="p-3 text-center align-middle fs-5">
                                                        {t('No items added...', 'لا توجد اصناف مضافة ...')}
                                                    </td>
                                                </tr>
                                            </React.Fragment>
                                        )}
                                    </tbody>
                                </table>
                            </div>
                            <div className=" card-footer p-0 bg-white" id="orderDetails">
                                <table className="table table-bordered mb-0">
                                    <tbody>
                                        <tr>
                                            <td
                                                colSpan={3}
                                                width={200}
                                                className="text-center align-end clickable-cell"
                                                onClick={this.togglePaidButton}>
                                                {this.state.isPaid === true ? 'Paid' : 'Unpaid'}
                                            </td>
                                        </tr>

                                        <tr>
                                            <td width={200}>
                                                {t('Customer', 'الزبون')}:{' '}
                                                {this.state.customer ? <span className="fw-bold">{this.state.customer.name} <br/>Balance:{this.state.customer.balance} </span> : 'N/A'}
                                                {this.state.customer && (
                                                    <div className="float-end">
                                                        <XCircleIcon
                                                            className="hero-icon-sm align-middle text-danger cursor-pointer user-select-none"
                                                            onClick={event => this.removeCustomer()}
                                                        />
                                                    </div>
                                                )}
                                            </td>
                                            <td width={200} className="text-end">
                                                {t('Subtotal', 'المجموع')}
                                            </td>
                                            <td width={200} className="align-middle text-center">
                                                {this.currencyFormatValue(this.state.subtotal)}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td
                                                width={200}
                                                className="text-start align-middle clickable-cell"
                                                data-bs-toggle="modal"
                                                data-bs-target="#deliveryChargeModal">
                                                {this.getAppSettings().enableTakeoutAndDelivery ? (
                                                    <>
                                                        {this.isOrderDelivery() && (
                                                            <>
                                                                {t('Delivery Charge', 'رسوم التوصيل')} :{' '}
                                                                {this.state.deliveryCharge
                                                                    ? this.currencyFormatValue(this.state.deliveryCharge)
                                                                    : 'N/A'}
                                                            </>
                                                        )}
                                                    </>
                                                ) : (
                                                    <>
                                                        {t('Delivery Charge', 'رسوم التوصيل')} :{' '}
                                                        {this.state.deliveryCharge ? this.currencyFormatValue(this.state.deliveryCharge) : 'N/A'}
                                                    </>
                                                )}
                                            </td>
                                            <td
                                                width={200}
                                                className="text-end align-middle clickable-cell"
                                                data-bs-toggle="modal"
                                                data-bs-target="#discountModal">
                                                {t('Discount', 'الخصم')}
                                            </td>
                                            <td
                                                width={200}
                                                className="text-center text-danger align-middle clickable-cell"
                                                data-bs-toggle="modal"
                                                data-bs-target="#discountModal">
                                                {this.currencyFormatValue(this.state.discount || 0)}
                                            </td>
                                        </tr>
                                        <tr className="alert-success">
                                            {this.state.vatType == 'add' ? (
                                                <td
                                                    width={200}
                                                    className="text-start clickable-cell"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#taxModal">
                                                    {t('VAT', 'الضريبة')} {this.state.tax}%: {this.currencyFormatValue(this.getTotalTax())}
                                                </td>
                                            ) : (
                                                <td
                                                    width={200}
                                                    className="text-start clickable-cell"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#taxModal">
                                                    <div>
                                                        {t('TAX.AMOUNT', 'قيمة الضريبة')}: {this.currencyFormatValue(this.getTaxAmount())}
                                                    </div>
                                                    <div>
                                                        {t('VAT', 'الضريبة')} {this.state.tax}%: {this.currencyFormatValue(this.getVat())}
                                                    </div>
                                                </td>
                                            )}

                                            <td width={200} className="fw-bold text-end fs-5 align-middle">
                                                {t('Total', 'الإجمالي')}
                                            </td>
                                            <td width={200} className="text-center align-middle fw-bold fs-5">
                                                <div> {this.currencyFormatValue(this.state.total)}</div>
                                                {this.getAppSettings().showExchangeRateOnReceipt && <div>{this.receiptExchangeRate()}</div>}
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <button
                                type="button"
                                className="btn btn-success py-4 rounded-0 shadow-sm fs-3 btn-lg w-100"
                                data-bs-toggle="modal"
                                data-bs-target="#checkoutModal">
                                {t('CHECKOUT', 'الدفع')}
                            </button>
                            {/* <button type="button" className="btn btn-success py-4 rounded-0 shadow-sm fs-3 btn-lg w-100" onClick={e => this.storeOrder()}>
                                الدفع
                            </button> */}
                        </div>
                    </div>
                    <div className="col-md-4">
                        <div className="card w-100 card-gutter rounded-0">
                            <div className="card-header bg-white">
                                <div
                                    className="d-flex px-4 justify-content-between align-items-center"
                                    style={{ minHeight: 'calc(1.5em + 1rem + 5px)', padding: '0.5rem' }}>
                                    <div className="d-flex align-items-center">
                                        <a className="text-decoration-none cursor-pointer pe-2 fs-5" onClick={event => this.backClick()}>
                                            {t('CATEGORIES', 'الفئات')}
                                        </a>
                                        {this.state.showProducts && (
                                            <div className="d-flex align-items-center">
                                                {this.getAppSettings().dir == 'rtl' ? (
                                                    <ArrowLeftIcon className="hero-icon pe-2" />
                                                ) : (
                                                    <ArrowRightIcon className="hero-icon pe-2" />
                                                )}
                                                <span className="fw-normal text-muted pe-2 fs-5 text-uppercase" aria-current="page">
                                                    {this.state.categoryName}
                                                </span>
                                                {this.getAppSettings().dir == 'rtl' ? (
                                                    <ArrowLeftIcon className="hero-icon pe-2" />
                                                ) : (
                                                    <ArrowRightIcon className="hero-icon pe-2" />
                                                )}
                                            </div>
                                        )}
                                    </div>
                                    <select
                                        name="product"
                                        className="form-control w-50"
                                        value={this.state.selectItem}
                                        onChange={e => this.handleSelectItem(e)}>
                                        <option value="first">Select item</option>
                                        {this.state.categories.length > 0 &&
                                            this.state.categories.map((item: ICategory) => <option value={item.id}>{item.name}</option>)}
                                    </select>
                                </div>
                            </div>

                            <div className="card-body overflow-auto py-0">
                                {this.state.isLoadingCategories && (
                                    <div className="py-5">
                                        <div className="d-flex justify-content-center m-2">
                                            <div className="spinner-border text-primary" role="status" style={{ width: '4rem', height: '4rem' }}>
                                                <span className="visually-hidden">{t('Loading...', 'جاري التحميل...')}</span>
                                            </div>
                                        </div>
                                        <div className="fw-bold h3 text-center">{t('Loading...', 'جاري التحميل...')}</div>
                                    </div>
                                )}

                                {!this.state.showProducts && (
                                    <React.Fragment>
                                        {this.state.categories.length > 0 && (
                                            <div className="row">
                                                {this.state.categories.map((category: ICategory) => {
                                                    return (
                                                        <div key={category.id} className="col-lg-4 col-md-4 col-sm-6 col-6 mb-0 p-0">
                                                            <div
                                                                className="position-relative w-100 border cursor-pointer user-select-none"
                                                                onClick={event => this.categoryClick(category)}>
                                                                <picture>
                                                                    <source type="image/jpg" srcSet={category.image_url} />
                                                                    <img
                                                                        alt={category.name}
                                                                        src={category.image_url}
                                                                        aria-hidden="true"
                                                                        className="object-fit-cover h-100 w-100"
                                                                    />
                                                                </picture>
                                                                <div className="position-absolute bottom-0 start-0 h-100 d-flex flex-column align-items-center justify-content-center p-4 mb-0 w-100 cell-item-label text-center">
                                                                    <div className="product-name" dir="auto">
                                                                        {category.name}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    );
                                                })}
                                            </div>
                                        )}
                                    </React.Fragment>
                                )}
                                {this.state.showProducts && (
                                    <React.Fragment>
                                        {this.state.products.length > 0 && (
                                            <div className="row overflow-auto">
                                                {this.state.products.map((product: IProduct) => {
                                                    // console.log(product);
                                                    let _price: number | undefined;
                                                    switch (this.state.currentPrice) {
                                                        case 0:
                                                            _price = product.unit_price;
                                                            break;
                                                        case 1:
                                                            _price = product.box_price;
                                                            break;
                                                        case 2:
                                                            _price = product.wholesale_price;
                                                            break;
                                                        case 3:
                                                            _price = product.price_per_gram;
                                                            break;
                                                        case 4:
                                                            _price = product.price_per_kilogram;
                                                            break;
                                                        default:
                                                            _price = product.unit_price;
                                                            return;
                                                    }
                                                    return (
                                                        <>
                                                            {this.isProductAvailable(product) && (
                                                                <div key={product.id} className="col-lg-4 col-md-4 col-sm-6 col-6 mb-0 p-0">
                                                                    <div
                                                                        className="position-relative w-100 border cursor-pointer user-select-none"
                                                                        onClick={event => this.addToCart(product)}>
                                                                        <picture>
                                                                            <source type="image/jpg" srcSet={product.image_url} />
                                                                            <img
                                                                                alt={product.name}
                                                                                src={product.image_url}
                                                                                aria-hidden="true"
                                                                                className="object-fit-cover h-100 w-100"
                                                                            />
                                                                        </picture>
                                                                        <div className="position-absolute bottom-0 start-0 h-100 d-flex flex-column align-items-center justify-content-center p-4 mb-0 w-100 cell-item-label text-center">
                                                                            <div className="fw-normal">{this.currencyFormatValue(_price || 0)}</div>
                                                                            <div className="fw-bold" dir="auto">
                                                                                {product.full_name}
                                                                            </div>
                                                                            <div className="fw-normal">
                                                                                {this.state.currentPrice === 1
                                                                                    ? Math.floor(product.in_stock / (product.count_per_box || 10))
                                                                                    : product.in_stock}
                                                                                (
                                                                                {this.state.currentPrice === 1 ? product.box_unit : product.cost_unit}
                                                                                )
                                                                            </div>
                                                                            <div className="fw-normal">{product.expiry_date ?? ''}</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            )}
                                                        </>
                                                    );
                                                })}
                                            </div>
                                        )}
                                    </React.Fragment>
                                )}
                            </div>
                        </div>
                    </div>
                </div>
                <div className="modal zoom-out-entrance" id="discountModal" tabIndex={-1} aria-labelledby="discountModalLabel" aria-hidden="true">
                    <div className="modal-dialog modal-dialog-centered">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title" id="discountModalLabel">
                                    {t('Discount', 'الخصم')}
                                </h5>
                                {this.modalCloseButton()}
                            </div>
                            <div className="modal-body">
                                <h3 className="text-center">{this.currencyFormatValue(this.state.discount || 0)}</h3>
                                <div className="mb-3">
                                    <input
                                        type="number"
                                        className="form-control form-control-lg text-center"
                                        onFocus={e => e.target.select()}
                                        value={this.state.discount}
                                        onChange={this.handleDiscountChange}
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div
                    className="modal zoom-out-entrance"
                    id="deliveryChargeModal"
                    tabIndex={-1}
                    aria-labelledby="deliveryChargeModalLabel"
                    aria-hidden="true">
                    <div className="modal-dialog modal-dialog-centered">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title d-flex" id="deliveryChargeModalLabel">
                                    {t('Delivery Charge', 'رسوم التوصيل')}
                                </h5>
                                {this.modalCloseButton()}
                            </div>
                            <div className="modal-body">
                                <h3 className="text-center">{this.currencyFormatValue(this.state.deliveryCharge || 0)}</h3>
                                <div className="mb-3">
                                    <input
                                        type="number"
                                        className="form-control form-control-lg text-center"
                                        value={this.state.deliveryCharge}
                                        onChange={this.handleDeliveryChargeChange}
                                        onFocus={e => e.target.select()}
                                    />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="modal zoom-out-entrance" id="taxModal" tabIndex={-1} aria-labelledby="taxModalLabel" aria-hidden="true">
                    <div className="modal-dialog modal-dialog-centered">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title" id="taxModalLabel">
                                    {t('VAT', 'الضريبة')}
                                </h5>
                                {this.modalCloseButton()}
                            </div>
                            <div className="modal-body">
                                <h3 className="text-center">{this.state.tax || 0}%</h3>
                                <div className="mb-3">
                                    <input
                                        type="number"
                                        className="form-control form-control-lg text-center"
                                        onFocus={e => e.target.select()}
                                        value={this.state.tax}
                                        onChange={this.handleTaxChange}
                                    />
                                </div>
                                <div className="mb-3">
                                    <select
                                        name="vatType"
                                        id="vat-type"
                                        className="form-select form-select-lg"
                                        onChange={this.handleVatTypeChange}
                                        value={this.state.vatType}>
                                        <option value="exclude"> {t('Exclude', 'استثناء')}</option>
                                        <option value="add">{t('Add', 'إضافة')}</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="modal zoom-out-entrance" id="customerModal" tabIndex={-1} aria-labelledby="customerModalLabel" aria-hidden="true">
                    <div className="modal-dialog modal-dialog-centered">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title d-flex" id="customerModalLabel">
                                    {t('Customer', 'الزبون')}
                                </h5>
                                {this.modalCloseButton()}
                            </div>
                            <div className="modal-body p-0">
                                <nav>
                                    <div className="nav nav-tabs nav-justified" id="nav-tab" role="tablist">
                                        <button
                                            className="nav-link rounded-0 active"
                                            id="nav-search-customer-tab"
                                            data-bs-toggle="tab"
                                            data-bs-target="#nav-search-customer"
                                            type="button"
                                            role="tab"
                                            aria-controls="nav-search-customer"
                                            aria-selected="true">
                                            {t('Search', 'ابحث')}
                                        </button>
                                        <button
                                            className="nav-link rounded-0"
                                            id="nav-create-customer-tab"
                                            data-bs-toggle="tab"
                                            data-bs-target="#nav-create-customer"
                                            type="button"
                                            role="tab"
                                            aria-controls="nav-create-customer"
                                            aria-selected="false">
                                            {t('Create', 'إنشاء')}
                                        </button>
                                    </div>
                                </nav>
                                <div className="tab-content" id="nav-tabContent">
                                    <div
                                        className="tab-pane fade show active"
                                        id="nav-search-customer"
                                        role="tabpanel"
                                        aria-labelledby="nav-search-customer-tab"
                                        tabIndex={0}>
                                        <div className="position-relative w-100">
                                            <input
                                                type="search"
                                                className="form-control form-control-lg rounded-0 shadow-none"
                                                name="search"
                                                id="search"
                                                autoComplete="off"
                                                placeholder={t('Search...', 'بحث...')}
                                                onChange={event => this.handleCustomerSearchChange(event)}
                                            />
                                        </div>
                                        <div className="overflow-auto" style={{ height: '250px' }}>
                                            {this.state.customers.length > 0 && (
                                                <React.Fragment>
                                                    {this.state.customers.map((cuts: ICustomer) => {
                                                        return (
                                                            <div
                                                                className="py-2 px-3 clickable-cell border-bottom"
                                                                onClick={e => this.selectCustomer(cuts)}
                                                                key={cuts.id}>
                                                                <div className="fw-bold">{cuts.name}</div>
                                                                <div className="small text-muted">{cuts.contact}</div>
                                                                <div className="small text-muted">{cuts.full_address}</div>
                                                            </div>
                                                        );
                                                    })}
                                                </React.Fragment>
                                            )}
                                        </div>
                                    </div>
                                    <div
                                        className="tab-pane fade p-3"
                                        id="nav-create-customer"
                                        role="tabpanel"
                                        aria-labelledby="nav-create-customer-tab"
                                        tabIndex={0}>
                                        <form method="POST" onSubmit={this.createCustomer} role="form" id="create-customer-form">
                                            <div className="mb-3">
                                                <label className=" form-label fw-bold">{t('Customer Name', 'اسم الزبون')}*</label>
                                                <input
                                                    type="text"
                                                    className="form-control form-control-lg"
                                                    onChange={event => this.handleCustomerNameChange(event)}
                                                />
                                            </div>
                                            <div className="mb-3">
                                                <label className=" form-label fw-bold">{t('Email', 'البريد الإلكتروني')}</label>

                                                <input
                                                    type="email"
                                                    className="form-control form-control-lg"
                                                    onChange={event => this.handleCustomerEmailChange(event)}
                                                />
                                            </div>
                                            <div className="mb-3">
                                                <label className=" form-label fw-bold">{t('Mobile Number', 'رقم الجوال')}</label>
                                                <input
                                                    type="tel"
                                                    className="form-control form-control-lg"
                                                    onChange={event => this.handleCustomerMobileChange(event)}
                                                />
                                            </div>
                                            <div className="text-muted">{t('Address', 'العنوان')}</div>
                                            <div className="mb-3">
                                                <label className=" form-label fw-bold">{t('City', 'المدينة')}</label>
                                                <input
                                                    type="text"
                                                    className="form-control form-control-lg"
                                                    onChange={event => this.handleCustomerCityChange(event)}
                                                />
                                            </div>
                                            <div className="row">
                                                <div className="col-md-6 mb-3">
                                                    <label className=" form-label fw-bold">{t('Street', 'الشارع')}</label>
                                                    <input
                                                        type="text"
                                                        className="form-control form-control-lg"
                                                        onChange={event => this.handleCustomerStreetChange(event)}
                                                    />
                                                </div>
                                                <div className="col-md-6 mb-3">
                                                    <label className=" form-label fw-bold">{t('Building', 'المبنى')}</label>
                                                    <input
                                                        type="text"
                                                        className="form-control form-control-lg"
                                                        onChange={event => this.handleCustomerBuildingChange(event)}
                                                    />
                                                </div>
                                            </div>
                                            <div className="row">
                                                <div className="col-md-6 mb-3">
                                                    <label className=" form-label fw-bold">{t('Floor', 'الطابق')}</label>
                                                    <input
                                                        type="text"
                                                        className="form-control form-control-lg"
                                                        onChange={event => this.handleCustomerFloorChange(event)}
                                                    />
                                                </div>
                                                <div className="col-md-6 mb-3">
                                                    <label className=" form-label fw-bold">{t('Apartment', 'الشقة')}</label>
                                                    <input
                                                        type="text"
                                                        className="form-control form-control-lg"
                                                        onChange={event => this.handleCustomerApartmentChange(event)}
                                                    />
                                                </div>
                                                <div className="col-md-12 mb-3">
                                                    <table width="100%">
                                                        <thead>
                                                            <tr>
                                                            <th>Bucket Types</th>
                                                            <th>Stock</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            {this.state.buckets.map((bucket) => {
                                                            // Use plastic_bucket_stock for the input value,
                                                            // falling back to 0 if not available.
                                                            const value = this.state.plastic_bucket_stock[bucket.id]?.stock ?? 0;
                                                            return (
                                                                <tr key={bucket.id}>
                                                                <td width="50%">{bucket.category_name}</td>
                                                                <td>
                                                                    <input
                                                                    type="number"
                                                                    className="form-control text-center w-full"
                                                                    value={value}
                                                                    onChange={(e) => this.handleStockChange(bucket.id, e)}
                                                                    />
                                                                </td>
                                                                </tr>
                                                            );
                                                            })}
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <button className="btn btn-primary btn-lg w-100" type="submit" disabled={this.state.isLoading}>
                                                {t('Create Customer', 'إنشاء زبون جديد')}
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div className="modal zoom-out-entrance" id="checkoutModal" tabIndex={-1} aria-labelledby="checkoutModalLabel" aria-hidden="true">
                    <div className="modal-dialog modal-dialog-centered modal-lg">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h5 className="modal-title" id="checkoutModalLabel"></h5>
                                {this.modalCloseButton()}
                            </div>
                            <div className="modal-body py-0">
                                <div className="row">
                                    <div className="col-6 py-3 bg-primary-sec">
                                        <table className="table table-borderless">
                                            <tbody>
                                                <tr>
                                                    <td className="text-danger-sec"> {t('Subtotal', 'المجموع')}</td>
                                                    <td className="text-white">{this.currencyFormatValue(this.state.subtotal)}</td>
                                                </tr>
                                                <tr>
                                                    <td className="text-danger-sec"> {t('Quantity', 'الكمية')}</td>
                                                    <td className="text-white">
                                                        {this.state.cart.reduce(function (prev, current) {
                                                            return prev + +(current.quantity || 0);
                                                        }, 0)}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td className="text-danger-sec"> {t('Discount', 'الخصم')}</td>
                                                    <td className="text-white">{this.currencyFormatValue(this.state.discount || 0)}</td>
                                                </tr>
                                                <tr>
                                                    <td className="text-danger-sec"> {t('Delivery Charge', 'رسوم التوصيل')}</td>
                                                    <td className="text-white">{this.currencyFormatValue(this.state.deliveryCharge || 0)}</td>
                                                </tr>
                                                {this.state.vatType == 'add' ? (
                                                    <tr>
                                                        <td className="text-danger-sec">
                                                            {' '}
                                                            {t('VAT', 'الضريبة')} {this.state.tax || 0}%
                                                        </td>
                                                        <td className="text-white">{this.currencyFormatValue(this.getTotalTax())}</td>
                                                    </tr>
                                                ) : (
                                                    <>
                                                        <tr>
                                                            <td className="text-danger-sec"> {t('Tax Amount', 'القيمة الضريبية')}</td>
                                                            <td className="text-white">{this.currencyFormatValue(this.getTaxAmount())}</td>
                                                        </tr>
                                                        <tr>
                                                            <td className="text-danger-sec">
                                                                {t('VAT', 'الضريبة')} {this.state.tax || 0}%
                                                            </td>
                                                            <td className="text-white">{this.currencyFormatValue(this.getVat())}</td>
                                                        </tr>
                                                    </>
                                                )}
                                                <tr className="fw-bold">
                                                    <td className="text-danger-sec"> {t('Bucket Total', 'إجمالي الدلو')}</td>
                                                    <td className="text-white">{this.currencyFormatValue(this.state.bucketTotalPrice)}</td>
                                                </tr>
                                                <tr className="fw-bold">
                                                    <td className="text-danger-sec"> {t('Returned Bucket Total', 'إجمالي الدلو المرتجع')}</td>
                                                    <td className="text-white">{this.currencyFormatValue(this.state.returnBucketTotalPrice)}</td>
                                                </tr>
                                                <tr className="fw-bold">
                                                    <td className="text-danger-sec"> {t('Total', 'المجموع الإجمالي')}</td>
                                                    <td className="text-white">{this.currencyFormatValue(this.state.total)}</td>
                                                </tr>
                                                
                                                {this.state.customer && (
                                                    <React.Fragment>
                                                        <tr>
                                                            <td className="text-danger-sec align-middle"> {t('Customer', 'الزبون')}</td>
                                                            <td className="text-white">{this.state.customer.name}</td>
                                                        </tr>
                                                        <tr>
                                                            <td className="text-danger-sec align-middle">{t('Contact', 'الاتصال')}</td>
                                                            <td className="text-white">{this.state.customer.contact}</td>
                                                        </tr>
                                                        <tr>
                                                            <td className="text-danger-sec align-middle">{t('Address', 'العنوان')}</td>
                                                            <td className="text-white">{this.state.customer.full_address}</td>
                                                        </tr>
                                                    </React.Fragment>
                                                )}
                                            </tbody>
                                        </table>
                                        <hr />
                                        <div className="mb-3">
                                            <label htmlFor="remarks" className="form-label text-danger-sec">
                                                {t('Notes', 'الملاحظات')}
                                            </label>
                                            <textarea
                                                className="form-control"
                                                id="remarks"
                                                rows={3}
                                                onChange={event => this.handleRemarksChange(event)}>
                                                {this.state.remarks}
                                            </textarea>
                                        </div>
                                    </div>
                                    <div className="col-6 py-3 bg-body d-flex flex-column">
                                        <div className="text-center text-danger"> {t('CHECKOUT', 'الدفع')}</div>
                                        <hr />
                                        <div className="mb-3">
                                            <div className="form-label text-center"> {t('Tender Amount', 'المبلغ المدفوع')}</div>
                                            <input
                                                type="number"
                                                className="form-control form-control-lg text-center"
                                                value={this.state.tenderAmount?.toFixed(2)}
                                                onFocus={e => e.target.select()}
                                                onChange={this.handleTenderAmountChange}
                                            />
                                        </div>
                                        <div className="mb-3">
                                            <div className="form-label text-center"> {t('Customer Amount', 'مبلغ العميل')}</div>
                                            <input
                                                type="number"
                                                className="form-control form-control-lg text-center"
                                                value={this.state.customerAmount}
                                                onFocus={e => e.target.select()}
                                                onChange={this.handleCustomerAmountChange}
                                            />
                                        </div>
                                        <div className="mb-3">
                                            <div className="form-label text-center"> {t('Return', 'مبلغ العميل')}</div>
                                            <div className="form-label text-center">{this.currencyFormatValue(this.state.returnAmount)}</div>
                                        </div>

                                        {/* --------- Bucket Number ------ */}
                                        <hr />
                                        <div className="accordion accordion-flush" id="accordionFlushExample">
                                            <div className="accordion-item">
                                                <h2 className="accordion-header" id="flush-headingOne">
                                                <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                                    <strong>Sale Plastic Buckets</strong>
                                                </button>
                                                </h2>
                                                <div id="flush-collapseOne" className="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                                                <div className="accordion-body">
                                                <table width="100%">
                                                    <thead>
                                                    <tr>
                                                        <th>Type</th>
                                                        <th>Qty</th>
                                                        <th>Cost</th>
                                                        <th>Total</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    {this.state.buckets.map((bucket) => {
                                                        const { qty, cost } = this.state.bucketInputs[bucket.id] || { qty: 0, cost: 0 };
                                                        return (
                                                        <tr key={bucket.id}>
                                                            <td width="50%">{bucket.category_name}</td>
                                                            <td>
                                                            <input
                                                                type="number"
                                                                className="form-control text-center w-full"
                                                                value={qty}
                                                                onChange={(e) => this.handleQtyChange(bucket.id, e)}
                                                            />
                                                            </td>
                                                            <td>
                                                            <input
                                                                type="number"
                                                                className="form-control text-center w-full"
                                                                value={cost}
                                                                onChange={(e) => this.handleCostChange(bucket.id, e)}
                                                            />
                                                            </td>
                                                            <td align="right">${(qty * cost).toFixed(2)}</td>
                                                        </tr>
                                                        );
                                                    })}
                                                    {/* Additional row for the overall total */}
                                                    <tr>
                                                        <td colSpan={3} align="right">
                                                        <strong>Overall Total:</strong>
                                                        </td>
                                                        <td align="right">
                                                        <strong>${overallTotal.toFixed(2)}</strong>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div className="accordion accordion-flush" id="returnBuckets">
                                            <div className="accordion-item">
                                                <h2 className="accordion-header" id="flush-headingTwo">
                                                <button className="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseOne">
                                                    <strong>Return Plastic Buckets</strong>
                                                </button>
                                                </h2>
                                                <div id="flush-collapseTwo" className="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#returnBuckets">
                                                <div className="accordion-body">
                                                <table width="100%">
                                                    <thead>
                                                        <tr>
                                                        <th>Type</th>
                                                        <th>Qty</th>
                                                        <th>Cost</th>
                                                        <th>Total</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        {this.state.buckets.map((bucket) => {
                                                        const { qty, cost } =
                                                            this.state.returnBucketInputs[bucket.id] || { qty: 0, cost: 0 };
                                                        return (
                                                            <tr key={bucket.id}>
                                                            <td width="50%">{bucket.category_name}</td>
                                                            <td>
                                                                <input
                                                                type="number"
                                                                className="form-control text-center w-full"
                                                                value={qty}
                                                                onChange={(e) => this.handleReturnQtyChange(bucket.id, e)}
                                                                />
                                                            </td>
                                                            <td>
                                                                <input
                                                                type="number"
                                                                className="form-control text-center w-full"
                                                                value={cost}
                                                                onChange={(e) => this.handleReturnCostChange(bucket.id, e)}
                                                                />
                                                            </td>
                                                            <td align="right">${(qty * cost).toFixed(2)}</td>
                                                            </tr>
                                                        );
                                                        })}
                                                        <tr>
                                                        <td colSpan={3} align="right">
                                                            <strong>Overall Return Total:</strong>
                                                        </td>
                                                        <td align="right">
                                                            <strong>${returnOverallTotal.toFixed(2)}</strong>
                                                        </td>
                                                        </tr>
                                                    </tbody>
                                                    </table>

                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr />


                                        <table className="table table-borderless d-none">
                                            <tbody>
                                                <tr className="fw-bold">
                                                    <td className="text-danger-sec">
                                                        {this.getChangeAmount() < 0 ? t('Owe', 'مدين') : t('Change', 'الباقي')}
                                                    </td>
                                                    <td className="text-end">{this.currencyFormatValue(this.getChangeAmount())}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div className="mt-auto">
                                            {/* <button className="btn btn-primary btn-lg py-3 w-100 disabled cursor-not-allowed mb-3">
                                                <i className="bi bi-credit-card me-2"></i> {t('PAY WITH CARD', 'الدفع بالبطاقة')}
                                            </button> */}
                                            <button
                                                className="btn btn-primary btn-lg py-3 w-100"
                                                disabled={this.state.isLoading}
                                                onClick={e => {
                                                    e.preventDefault();
                                                    this.storeOrder();
                                                }}>
                                                {t('SUBMIT', 'حفظ')}
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <ToastContainer position="bottom-left" autoClose={2000} pauseOnHover theme="colored" hideProgressBar={true} />
            </React.Fragment>
        );
    }
}
export default PointOfSale;

const element = document.getElementById('pos');
if (element) {
    const props = Object.assign({}, element.dataset);
    const root = ReactDOM.createRoot(element);
    root.render(<PointOfSale settings={''} {...props} />);
}
