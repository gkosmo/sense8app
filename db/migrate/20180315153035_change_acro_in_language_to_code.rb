class ChangeAcroInLanguageToCode < ActiveRecord::Migration[5.1]
  def change
    rename_column :languages, :acro, :code
  end
end
