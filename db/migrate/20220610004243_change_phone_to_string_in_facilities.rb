class ChangePhoneToStringInFacilities < ActiveRecord::Migration[6.1]
  def change
    change_column :facilities, :phone, :string
  end
end
