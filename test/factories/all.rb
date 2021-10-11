FactoryBot.define do
    factory :post do
      title { "Пост о стиле Handpoke" }
      body  { "Много информации о стиле HandPoke" }
      
      trait :about_hp do
        title { "Пост о стиле Handpoke" }
        body  { "Много информации о стиле HandPoke" }
        association :topic, factory: [:topic, :hp]
      end  
      trait :about_bw do
        title { "Пост о стиле BlackWork" }
        body { "Много информации о стиле BlackWork" }
        association :topic, factory: [:topic, :bw]
      end  
      trait :about_ns do
        title { "Пост о стиле NewSchool" }
        body { "Много информации о стиле NewSchool" }
        association :topic, factory: [:topic, :ns]
      end  
      trait :about_mao do
        title { "Пост о стиле Maori" }
        body { "Много информации о стиле Maori" }
        association :topic, factory: [:topic, :mao]
      end  
      trait :about_pg do
        title { "Пост о стиле Paganism" }
        body { "Много информации о стиле Paganism" }
        association :topic, factory: [:topic, :pg]
      end  
      trait :about_tm do
        title { "Пост о tattoo machines" }
        body { "Много информации о тату машинках" }
        association :topic, factory: [:topic, :tm]
      end 
      trait :about_ti do
        title { "Пост о tattoo inks" }
        body { "Много информации о чернилах" }
        association :topic, factory: [:topic, :ti]
      end   
      trait :about_tnc do
        title { "Пост о tattoo needles and cartriders" }
        body { "Много информации о иглах для татуировок " }
        association :topic, factory: [:topic, :tnc]
      end  
      trait :about_gtt do
        title { "Пост о grips tips and tubes" }
        body { "Много информации о наконечниках и колбах" }
        association :topic, factory: [:topic, :gtt]
      end  
      trait :about_tps do
        title { "Пост о tattoo power supplies" }
        body { "Много информации о питании для тату машинки" }
        association :topic, factory: [:topic, :tps]
      end  
      trait :about_ta do
        title { "Пост о tattoo aftercare" }
        body { "Много информации о уходе за татуировкой" }
        association :topic, factory: [:topic, :ta]
      end  
      trait :about_me do
        title { "Пост о medical equipment" }
        body { "Много информации о медицинском оборудовании" }
        association :topic, factory: [:topic, :me]
      end  
    end
    
    factory :topic do
        trait :hp do
          add_attribute(:alias) { "hp" }
          title { "HandPoke" }
        end  
        trait :bw do 
          add_attribute(:alias) { "bw" }
          title { "BlackWork" }
        end  
        trait :ns do
          add_attribute(:alias) { "ns" }
          title { "NewSchool" }
        end  
        trait :mao do
          add_attribute(:alias) { "mao" }
          title { "Maori" }
        end  
        trait :pg do
          add_attribute(:alias) { "pg" }
          title { "Paganism" }
        end  
        trait :tm do
            add_attribute(:alias) { "tm" }
            title { "Tattoo Machines" }
          end  
          trait :ti do
            add_attribute(:alias) { "ti" }
            title { "Tattoo Inks" }
          end  
          trait :tnc do
            add_attribute(:alias) { "tnc" }
            title { "Tattoo Needles and Cartriders" }
          end  
          trait :gtt do
            add_attribute(:alias) { "gtt" }
            title { "Grips Tips and Tubes" }
          end  
          trait :tps do
            add_attribute(:alias) { "tps" }
            title { "Tattoo Power Supplies" }
          end  
          trait :ta do
            add_attribute(:alias) { "ta" }
            title { "Tattoo Aftercere" }
          end  
          trait :me do
            add_attribute(:alias) { "me" }
            title { "Medical Equipment" }
          end  
    end

    factory :comment do
      body  { "Nice Tattoo" }
      parent_id { 0 }
      association :post, factory: :post
    end  
  end