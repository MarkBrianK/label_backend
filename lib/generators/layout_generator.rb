class LayoutGenerator < Rails::Generators::Base
  source_root File.expand_path('templates', __dir__)

  def create_layout_file
    copy_file 'layout.html.erb', 'app/views/layouts/layout.html.erb'
  end
end
