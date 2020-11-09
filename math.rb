def recur_fact(num)
  if num == 0 || num == 1
    1
  else
    num * recur_fact(num - 1)
  end
end


def recur_fib(n)
  acc = [0, 1]

  f = ->(acc) {
    if acc.size == n
      acc
    else
      cur, last = acc.last(2)
      f.(acc + [cur + last])
    end
  }

  f.(acc)
end





variants = Hash.new(0)
params[:variant].each_with_index do |variant_id, i|
  variants[variant_id] += params[:quantity][i].to_i
end



variants = Hash.new(0).tap do |hash|
  params[:variant].each_with_index do |variant_id, i|
    hash[variant_id] += params[:quantity][i].to_i
  end
end


stock_transfer = StockTransfer.create(reference: params[:reference])
stock_transfer.transfer(source_location,
                        destination_location,
                        variants)

flash[:success] = Spree.t(:stock_successfully_transferred)
redirect_to admin_stock_transfer_path(stock_transfer)
