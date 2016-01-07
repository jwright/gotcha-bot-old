Lotus::Model.migration do
  change do
    create_table :teams do
      primary_key :id
      column :access_token,       String, null: false
      column :name,               String, null: false
      column :team_id,            String, null: false
    end
  end
end
