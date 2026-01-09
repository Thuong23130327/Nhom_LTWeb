package model;

import java.util.List;

public class ProductDTO {
	private Product product;
	private List<ProductVariant> variants;
	private List<ProductSpec> specs;
	private List<String> gallery;
    private ProductVariant variantDefault;

	public ProductDTO() {
	}

	public ProductDTO(Product product, List<ProductVariant> variants, List<ProductSpec> specs, List<String> gallery,ProductVariant variantDefault) {
		super();
		this.product = product;
		this.variants = variants;
		this.specs = specs;
		this.gallery = gallery;
        this.variantDefault = variantDefault;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<ProductVariant> getVariants() {
		return variants;
	}

	public void setVariants(List<ProductVariant> variants) {
		this.variants = variants;
	}

	public List<ProductSpec> getSpecs() {
		return specs;
	}

	public void setSpecs(List<ProductSpec> specs) {
		this.specs = specs;
	}

	public List<String> getGallery() {
		return gallery;
	}

	public void setGallery(List<String> gallery) {
		this.gallery = gallery;
	}

    public ProductVariant getVariantDefault() {
        return variantDefault;
    }
    public void setVariantDefault(ProductVariant variantDefault) {
        this.variantDefault = variantDefault;
    }
}
