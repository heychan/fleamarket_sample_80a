class PurchasesController < ApplicationController
  require 'payjp'
  before_action :set_card, only: [:pay_index, :pay]
  before_action :set_item

  def pay_index
    unless user_signed_in?
      redirect_to new_user_registration_path
      
    end
    
    @address =Address.find(current_user.id)
    @card = @set_card.first
    if @card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @card = @set_card.first
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
    amount: @item.price,
    customer: @card.customer_id,
    currency: 'jpy'
  )
  redirect_to action: 'done', item_id: @item
  end

  def done
    Purchase.create(item_id: @item.id, user_id: current_user.id)
  end

  private

  def set_card
    @set_card = Card.where(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
