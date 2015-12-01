class TVHomepage < SitePrism::Page

  set_url "http://www.which.co.uk/reviews/televisions"

  elements :categories, '.inner-label'
  elements :products, '.products'
  elements :sizes, '.product-listing__key-fact'
  elements :product_names, ".product-listing__manufacturer"
  elements :quotes, ".price-value > a"
 
  element :first_tv, ".products li:first-of-type"
  element :hero, ".main-image.container.hero-image-wrapper.gallery"
  element :login,   ".button.show-signin .login-label"
  element :check, ".container-facets > input"

  def find_text(selector, text)
    selector.each do |link|
      return link if link.text.include?(text)
    end
  end
end