ActiveAdmin.register Instructor do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :id, :name, :bio, :image, {course_ids: []}
  #
  controller do
    def find_resource
      scoped_collection.find(params[:id])
    end
  end
  
  index do
    column :id
    column :name
    column "Courses" do |instructor|
      (instructor.courses.map{ |p| p.title }).join(', ')
    end
    column :created_at
    column :updated_at
    default_actions
  end

  form html: { multipart: true } do |f|
    f.inputs do
      f.input :image, as: :file
      f.input :name
      f.input :courses, as: :check_boxes, input_html: { multiple: true } # add courses input here
      f.input :bio
    end
    f.actions
  end
  
end
