Lotus::Model.migration do
  change do
    create_table :players do
      primary_key :id
      column :username,           String, null: false
      column :email,              String, null: false
      column :first_name,         String
      column :last_name,          String
      column :avatar_url,         String
      column :user_id,            String, null: false

      foreign_key :team_id, :teams, on_delete: :cascade, null: false
    end
  end
end
