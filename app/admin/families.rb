ActiveAdmin.register Family do
  permit_params :name, :is_active, :info
  menu parent: "Sectors"

  index do
    selectable_column
    column :id
    column :name
    column :is_active
    column :sub_sector
    column :sector
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      # f.input :sector
      # f.input :sub_sector
      f.input :is_active
      f.input :info, as: :text
    end
    f.actions
  end
end
