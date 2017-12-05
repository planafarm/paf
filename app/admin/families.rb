ActiveAdmin.register Family do
  permit_params :name, :is_active
  config.sort_order = "id_asc"
  menu priority: 5

  index do
    selectable_column
    column :id
    column :name
    column :is_active
    column :sub_sector
    column :sector
    actions
  end
end
