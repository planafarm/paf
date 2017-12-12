ActiveAdmin.register Entry do
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
end
