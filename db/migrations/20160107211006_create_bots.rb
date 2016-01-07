Lotus::Model.migration do
  change do
    create_table :bots do
      primary_key :id
      column :access_token,       String, null: false
      column :name,               String
      column :bot_id,             String, null: false

      foreign_key :team_id, :teams, on_delete: :cascade, null: false
    end
  end
end
