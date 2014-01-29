ActiveAdmin.register Location do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :name, :slug, {course_ids: []}
  
  index do
    column :id
    column :name
    column "Courses" do |location|
      (location.courses.map{ |p| p.title }).join(', ')
    end
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :courses, as: :check_boxes, input_html: { multiple: true } # add courses input here
    end
    f.actions
  end

  show do
    div :class => 'panel' do
      h3 'Course Details'
      div :class => 'panel_contents' do
        div :class => 'attributes_table location' do
          table do
            tr do
              th { 'Title' }
              td { location.name }
            end
            tr do
              th { 'Courses' }
              td { (location.courses.map { |p| p.title }).join(', ') }
            end
          end # table
        end # attributes_table
      end # panel_contents
    end # panel
  end # show
  
end
