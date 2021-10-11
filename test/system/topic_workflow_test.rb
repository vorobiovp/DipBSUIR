require 'test_helper'
require 'application_system_test_case'

class TopicWorkflowTest < ApplicationSystemTestCase 
  def setup
    @post_hp = create(:post, :about_hp)
    @post_bw = create(:post, :about_bw)
    @post_ns = create(:post, :about_ns)
    @post_mao = create(:post, :about_mao)
    @post_pg = create(:post, :about_pg)
    @post_tm = create(:post, :about_tm)
    @post_ti = create(:post, :about_ti)
    @post_tnc = create(:post, :about_tnc)
    @post_gtt = create(:post, :about_gtt)
    @post_tps = create(:post, :about_tps)
    @post_ta = create(:post, :about_ta)
    @post_me = create(:post, :about_me)
  end

  test 'topic pages' do
    topics = [
        {
            "path" => "/posts/hp",
            "page_title" => " HandPoke",
            "post" => @post_hp
        },
        {
            "path" => "/posts/bw",
            "page_title" => "BlackWork",
            "post" => @post_bw
        },
        {
            "path" => "/posts/ns",
            "page_title" => "NewSchool",
            "post" => @post_ns
        },
        {
            "path" => "/posts/mao",
            "page_title" => "Maori",
            "post" => @post_mao
        },
        {
            "path" => "/posts/pg",
            "page_title" => "Paganism",
            "post" => @post_pg
        },
        {
            "path" => "/posts/tm",
            "page_title" => "Tattoo Machines",
            "post" => @post_tm
        },
        {
            "path" => "/posts/ti",
            "page_title" => "Tattoo Inks",
            "post" => @post_ti
        },
        {
            "path" => "/posts/tnc",
            "page_title" => "Tattoo Needles & Cartriders",
            "post" => @post_tnc
        },
        {
            "path" => "/posts/gtt",
            "page_title" => "Grips Tips & Tubes",
            "post" => @post_gtt
        },
        {
            "path" => "/posts/tps",
            "page_title" => "Tattoo Power Supplies",
            "post" => @post_tps
        },
        {
            "path" => "/posts/ta",
            "page_title" => "Tattoo Aftercare",
            "post" => @post_ta
        },
        {
            "path" => "/posts/me",
            "page_title" => "Medical Equipment",
            "post" => @post_me
        }
    ]

    topics.each do |topic_data|
        visit topic_data["path"]
        page.has_content?(topic_data["page_title"])
        page.has_content?(topic_data["post"].title)
        page.has_content?(topic_data["post"].body)
    end
  end
end