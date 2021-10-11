require 'test_helper'
require 'application_system_test_case'

class PaginationWorkflowTest < ApplicationSystemTestCase 
  def setup
    @topic_hp = create(:topic, :hp)
    @topic_bw = create(:topic, :bw)
    @topic_ns = create(:topic, :ns)
    @topic_mao = create(:topic, :mao)
    @topic_pg = create(:topic, :pg)
    @topic_tm = create(:topic, :tm)
    @topic_ti = create(:topic, :ti)
    @topic_tnc = create(:topic, :tnc)
    @topic_gtt = create(:topic, :gtt)
    @topic_tps = create(:topic, :tps)
    @topic_ta = create(:topic, :ta)
    @topic_me = create(:topic, :me)

    @post_hp = create_list(:post, 4, :about_hp, topic: @topic_hp)[0]
    @post_bw = create_list(:post, 4, :about_bw, topic: @topic_bw)[0]
    @post_ns = create_list(:post, 4, :about_ns, topic: @topic_ns)[0]
    @post_mao = create_list(:post, 4, :about_mao, topic: @topic_mao)[0]
    @post_pg = create_list(:post, 4, :about_pg, topic: @topic_pg)[0]
    @post_tm = create_list(:post, 4, :about_tm, topic: @topic_tm)[0]
    @post_ti = create_list(:post, 4, :about_ti, topic: @topic_ti)[0]
    @post_tnc = create_list(:post, 4, :about_tnc, topic: @topic_tnc)[0]
    @post_gtt = create_list(:post, 4, :about_gtt, topic: @topic_gtt)[0]
    @post_tps = create_list(:post, 4, :about_tps, topic: @topic_tps)[0]
    @post_ta = create_list(:post, 4, :about_ta, topic: @topic_ta)[0]
    @post_me = create_list(:post, 4, :about_me, topic: @topic_me)[0]
  end

  test 'index pagination' do
    visit "/"
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_me.title, count: 3)

    click_on "Older"

    page.has_css?("card-body", count: 3)
    page.has_content?(@post_me.title, count: 1)
    page.has_content?(@post_ta.title, count: 2)

    click_on "Older"

    page.has_css?("card-body", count: 3)
    page.has_content?(@post_ta.title, count: 2)
    page.has_content?(@post_tps.title, count: 1)

    click_on "Older"

    page.has_css?("card-body", count: 3)
    page.has_content?(@post_tps.title, count: 3)

    click_on "Older"

    page.has_css?("card-body", count: 3)
    page.has_content?(@post_gtt.title, count: 3)

    click_on "Older"

    page.has_css?("card-body", count: 3)
    page.has_content?(@post_gtt.title, count: 1)
    page.has_content?(@post_tnc.title, count: 2)

    click_on "Older"
    
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_tnc.title, count: 2)
    page.has_content?(@post_ti.title, count: 1)
    
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_ti.title, count: 3)
       
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_tm.title, count: 3)
       
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_tm.title, count: 1)
    page.has_content?(@post_pg.title, count: 2)
        
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_pg.title, count: 2)
    page.has_content?(@post_mao.title, count: 1)
        
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_mao.title, count: 3)
        
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_mao.title, count: 1)
    page.has_content?(@post_ns.title, count: 2)
        
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_ns.title, count: 2)
    page.has_content?(@post_bw.title, count: 1)
        
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_bw.title, count: 3)
        
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_hp.title, count: 3)
    
        
    page.has_css?("card-body", count: 1)
    page.has_content?(@post_tnc.title, count: 1)


    click_on "Newer"

    page.has_css?("card-body", count: 3)
    page.has_content?(@post_hp.title, count: 1)
    page.has_content?(@post_bw.title, count: 2)

    click_on "Newer"
    click_on "Newer"
    click_on "Newer"
    click_on "Newer"
    page.has_css?("card-body", count: 3)
    page.has_content?(@post_me.title, count: 3)
  end

  test 'topic pagination' do
    topics = [
        {
            "path" => "/posts/hp",
            "post" => @post_hp
        },
        {
            "path" => "/posts/bw",
            "post" => @post_bw
        },
        {
            "path" => "/posts/ns",
            "post" => @post_ns
        },
        {
            "path" => "/posts/mao",
            "post" => @post_mao
        },
        {
            "path" => "/posts/pg",
            "post" => @post_pg
        },
        {
            "path" => "/posts/tm",
            "post" => @post_tm
        },
        {
            "path" => "/posts/ti",
            "post" => @post_ti
        },
        {
            "path" => "/posts/tnc",
            "post" => @post_tnc
        },
        {
            "path" => "/posts/gtt",
            "post" => @post_gtt
        },
        {
            "path" => "/posts/tps",
            "post" => @post_tps
        },
        {
            "path" => "/posts/ta",
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
        page.has_content?(topic_data["post"].title, count: 3)
        click_on "Older"
        page.has_content?(topic_data["post"].title, count: 1)
        click_on "Newer"
        page.has_content?(topic_data["post"].title, count: 3)
    end    
  end
end