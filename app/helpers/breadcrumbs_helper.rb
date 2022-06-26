module BreadcrumbsHelper
  Breadcrumb = Struct.new(:name, :path)

  def breadcrumbs
    @breadcrumbs ||= [Breadcrumb.new("Home", root_path)]
  end

  def add_breadcrumb(name, path = nil)
    breadcrumbs << Breadcrumb.new(name.to_s, path)
  end
end