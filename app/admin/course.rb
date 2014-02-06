ActiveAdmin.register Course do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :title, :tagline, :description, {location_ids: []}

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
      f.input :description, as: :wysihtml5, commands: [:bold, :italic, :underline, :ul, :ol, :outdent, :indent, :link, :image, :source]
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
