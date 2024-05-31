import User from "../models/user.js";
import Product from "../models/product.js";
import Order from "../models/order.js";

export const addtoCart = async (req, res, next) => {
  try {
    const { id } = req.body;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);

    if (user.cart.length == 0) {
      user.cart.push({ product, quantity: 1 });
    } else {
      let isProductFound = false;
      for (let i = 0; i < user.cart.length; i++) {
        if (user.cart[i].product._id.equals(product._id)) {
          isProductFound = true;
        }
      }

      if (isProductFound) {
        let producttt = user.cart.find((productt) =>
          productt.product._id.equals(product._id)
        );
        producttt.quantity += 1;
      } else {
        user.cart.push({ product, quantity: 1 });
      }
    }
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

export const deleteFromCart = async (req, res, next) => {
  try {
    const { id } = req.params;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);

    for (let i = 0; i < user.cart.length; i++) {
      if (user.cart[i].product._id.equals(product._id)) {
        if (user.cart[i].quantity == 1) {
          user.cart.splice(i, 1);
        } else {
          user.cart[i].quantity -= 1;
        }
      }
    }
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

export const saveUserAddress = async (req, res, next) => {
  try {
    const { address } = req.body;
    let user = await User.findById(req.user);
    user.address = address;
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

export const orderProducts = async (req, res, next) => {
  try {
    const { cart, totalPrice, address } = req.body;
    let products = [];

    for (let i = 0; i < cart.length; i++) {
      let product = await Product.findById(cart[i].product._id);
      if (product.quantity >= cart[i].quantity) {
        product.quantity -= cart[i].quantity;
        products.push({ product, quantity: cart[i].quantity });
        await product.save();
      } else {
        return res
          .status(400)
          .json({ msg: `${product.name} is out of stock!` });
      }
    }

    let user = await User.findById(req.user);
    let toEmail = user.email;
    user.cart = [];
    user = await user.save();

    let order = new Order({
      products,
      totalPrice,
      address,
      userId: req.user,
      orderedAt: new Date().getTime(),
    });
    order = await order.save();

    const confirmationLink = `https://shop-s67f.onrender.com/api/user/confirm-order?orderId=${order._id}`;

    const mailOptions = {
      from: "ngquocdat.work@gmail.com",
      to: toEmail,
      subject: "Confirm Order",
      html: `Click <a href="${confirmationLink}"> to confirm</a>.`,
    };
    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        return res.status(500).send(error.toString());
      }
      return res
        .status(200)
        .send({ message: "Email sent: " + info.response, order: order });
    });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

export const viewOrders = async (req, res, next) => {
  try {
    const orders = await Order.find({ userId: req.user });
    res.json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

export const confirmOrder = async (req, res, next) => {
  try {
    const orderId = req.query.orderId;

    await Order.findOneAndUpdate({ orderId }, { status: 1 });

    res.status(200).json({message: "success"});
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};
