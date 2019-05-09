module AncestryHelper
  # Recursively render a partial from an Ancestry arranged subtree.
  def arranged_tree(tree, options = {}, current_depth = 0, &block)
    
    options[:branch_tag]    ||= :ul
    options[:list_tag]      ||= :li
    options[:branch_class]  ||= []
    options[:current_depth] ||= 0
    
    branch_options          = {}
    branch_options[:class]  = []
    branch_options[:class]  << options[:branch_class]
    
    list_options            = {}
    list_options[:class]    = []
    list_options[:class]    << options[:list_class]
    
    options[:current_depth] += 1
    
    if current_depth == 0
      branch_options[:class]  << options[:branch_class_root]
      list_options[:class]    << options[:list_class_root]
      branch_options.merge!(options[:branch_html_root]) if options[:branch_html_root]
      list_options.merge!(options[:list_html_root]) if options[:list_html_root]
    else
      branch_options[:class]  << options[:branch_class_children]
      list_options[:class]    << options[:list_class_children]
      branch_options.merge!(options[:branch_html_children]) if options[:branch_html_children]
      list_options.merge!(options[:list_html_children]) if options[:list_html_children]
    end
    
    content_tag(options[:branch_tag], branch_options) do
      tree.each do |node, children|
        
        output = content_tag(options[:list_tag], list_options) do
          concat capture(node, &block) if block_given?
          concat arranged_tree(children, options, current_depth, &block) if children.present?
        end
        
        concat output
      end
    end
  end
end