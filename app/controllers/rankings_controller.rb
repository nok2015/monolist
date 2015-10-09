class RankingsController < ApplicationController
  def have
    @all_items = Item.all
    @all_users = User.all
    @top10haves = Have.group("item_id").order('count_item_id desc').limit(10).count('item_id').keys
  end
  
  def want
    @all_items = Item.all
    @all_users = User.all
    @top10wants = Want.group("item_id").order('count_item_id desc').limit(10).count('item_id').keys
  end
end