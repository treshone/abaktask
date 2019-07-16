module PagesHelper
  def show_tree(page)
    tree = "<li>#{link_to page.name, subpage_path(page)}</li>"
    if page.has_children?
      tree += "<ul>"
      page.children.each do |page|
        tree += "#{show_tree(page)}"
      end
      tree += "</ul>"
    end
    tree.html_safe
  end
end
