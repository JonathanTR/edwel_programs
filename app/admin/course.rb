ActiveAdmin.register Course do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :title, :tagline, :description, :approach, {location_ids: [], content_blocks: []}, content_blocks_attributes: [:id, :content, :style, :_destroy]

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
  
  index do
    column :id
    column :title
    column "Locations" do |course|
      (course.locations.map{ |p| p.name }).join(' ')
    end
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :slug
      f.input :locations, as: :check_boxes, input_html: { multiple: true } # add locations input here
      f.input :tagline
      f.input :description, as: :wysihtml5, commands: [:bold, :italic, :underline, :ul, :ol, :outdent, :indent, :link, :image, :source], blocks: [:h1, :h2, :h3, :h4, :h5, :h6, :p]
      f.has_many :content_blocks do |cb|
        cb.input :content, label: "HTML5 Editor", as: :wysihtml5, commands: [:bold, :italic, :underline, :ul, :ol, :outdent, :indent, :link, :image, :source], blocks: [:h1, :h2, :h3, :h4, :h5, :h6, :p]
        cb.input :style, collection: ["default", "popup", "red-card", "blue-card", "yellow-card", "green-card"]
        cb.input :_destroy, as: :boolean, label: "Delete"
      end
    end
    f.actions
  end

  show do
    div :class => 'panel' do
      h3 'Course Details'
      div :class => 'panel_contents' do
        div :class => 'attributes_table course' do
          table do
            tr do
              th { 'Title' }
              td { course.title }
            end
            tr do
              th { 'Locations' }
              td { (course.locations.map { |p| p.name }).join(' ') }
            end
          end # table
        end # attributes_table
      end # panel_contents
    end # panel
  end # show


end
