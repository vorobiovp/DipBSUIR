class ModifyTopics < ActiveRecord::Migration[6.0]
    def change
        add_index :topics, :alias, unique: true
        Topic.create :alias => "hp", :title => "Hand Poke"
        Topic.create :alias => "bw", :title => "Black Work"
        Topic.create :alias => "ns", :title => "New School"
        Topic.create :alias => "mao", :title => "Maori"
        Topic.create :alias => "pg", :title => "Paganism"
        Topic.create :alias => "tm", :title => "Tattoo Machines"
        Topic.create :alias => "ti", :title => "Tattoo Inks"
        Topic.create :alias => "tnc", :title => "Tattoo Neddles & Cartredgers"
        Topic.create :alias => "gtt", :title => "Grips Tips & Tubes"
        Topic.create :alias => "tps", :title => "Tattoo Power Supplies"
        Topic.create :alias => "ta", :title => "Tatto Aftercare"
        Topic.create :alias => "me", :title => "Medical Equipment"
    end
end