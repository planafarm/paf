ActiveAdmin.register Entry do
  menu priority: 1
  index do
    selectable_column
    column :id
    column :user
    column :index
    column :sector
    column :sub_sector
    column :family
    column :product
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :user
      row :index
      row :sector
      row :sub_sector
      row :family
      row :product
      row :data do |e|
        input(value: e.data, class: "jsoneditor-view")
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
