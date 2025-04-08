// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: Dashboard()));
// }

// class Dashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             "Dashboard",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           backgroundColor: Colors.blue.shade700,
//           centerTitle: true,
//           elevation: 4,
//         ),
//         body: GridView.count(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           padding: const EdgeInsets.all(16),
//           children: [
//             DashboardCard(
//               title: "Home",
//               icon: Icons.home,
//               color: Colors.blue.shade400,
//               onTap: () {},
//             ),
//             DashboardCard(
//               title: "Transactions",
//               icon: Icons.receipt_long,
//               color: Colors.green.shade400,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => TransactionPage()),
//                 );
//               },
//             ),
//             DashboardCard(
//               title: "Orders",
//               icon: Icons.shopping_cart,
//               color: Colors.orange.shade400,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => OrdersPage()),
//                 );
//               },
//             ),
//             // Removed the Customers card
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DashboardCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final Color color;
//   final VoidCallback onTap;

//   DashboardCard({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.color,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(12),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [color, color.withOpacity(0.7)],
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: 60, color: Colors.white),
//               const SizedBox(height: 12),
//               Text(
//                 title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TransactionPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Transactions",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.green.shade700,
//         centerTitle: true,
//         elevation: 4,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           const TransactionHeader(),
//           const SizedBox(height: 16),
//           // Reduced to 3 transaction items only
//           TransactionItem(
//             title: "Coffee Shop",
//             amount: "-\$4.99",
//             date: "Today, 9:30 AM",
//             isExpense: true,
//             icon: Icons.coffee,
//           ),
//           TransactionItem(
//             title: "Salary Deposit",
//             amount: "+\$2,500.00",
//             date: "Yesterday, 12:00 PM",
//             isExpense: false,
//             icon: Icons.account_balance_wallet,
//           ),
//           TransactionItem(
//             title: "Grocery Store",
//             amount: "-\$65.40",
//             date: "Mar 15, 6:30 PM",
//             isExpense: true,
//             icon: Icons.shopping_basket,
//           ),
//           // Removed the other transaction items
//         ],
//       ),
//     );
//   }
// }

// class TransactionHeader extends StatelessWidget {
//   const TransactionHeader({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             const Text(
//               "Current Balance",
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               "\$4,250.75",
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildBalanceItem(
//                   context,
//                   Icons.arrow_downward,
//                   Colors.green,
//                   "Income",
//                   "\$2,850.00",
//                 ),
//                 _buildBalanceItem(
//                   context,
//                   Icons.arrow_upward,
//                   Colors.red,
//                   "Expense",
//                   "\$1,465.50",
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBalanceItem(
//     BuildContext context,
//     IconData icon,
//     Color color,
//     String title,
//     String amount,
//   ) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: color.withOpacity(0.1),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(icon, color: color),
//         ),
//         const SizedBox(height: 8),
//         Text(title, style: TextStyle(color: Colors.grey.shade600)),
//         const SizedBox(height: 4),
//         Text(
//           amount,
//           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//       ],
//     );
//   }
// }

// class TransactionItem extends StatelessWidget {
//   final String title;
//   final String amount;
//   final String date;
//   final bool isExpense;
//   final IconData icon;

//   const TransactionItem({
//     Key? key,
//     required this.title,
//     required this.amount,
//     required this.date,
//     required this.isExpense,
//     required this.icon,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         leading: Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color:
//                 isExpense
//                     ? Colors.red.withOpacity(0.1)
//                     : Colors.green.withOpacity(0.1),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(icon, color: isExpense ? Colors.red : Colors.green),
//         ),
//         title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         subtitle: Text(
//           date,
//           style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
//         ),
//         trailing: Text(
//           amount,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//             color: isExpense ? Colors.red : Colors.green,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OrdersPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Orders",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.orange.shade700,
//         centerTitle: true,
//         elevation: 4,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           // Reduced to 3 order items only
//           OrderItem(
//             orderNumber: "ORD-2023-001",
//             date: "Mar 16, 2023",
//             status: "Delivered",
//             amount: "\$125.99",
//             statusColor: Colors.green,
//           ),
//           OrderItem(
//             orderNumber: "ORD-2023-002",
//             date: "Mar 15, 2023",
//             status: "Processing",
//             amount: "\$78.50",
//             statusColor: Colors.orange,
//           ),
//           OrderItem(
//             orderNumber: "ORD-2023-003",
//             date: "Mar 14, 2023",
//             status: "Shipped",
//             amount: "\$245.00",
//             statusColor: Colors.blue,
//           ),
//           // Removed the other order items
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: Colors.orange.shade700,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// class OrderItem extends StatelessWidget {
//   final String orderNumber;
//   final String date;
//   final String status;
//   final String amount;
//   final Color statusColor;

//   const OrderItem({
//     Key? key,
//     required this.orderNumber,
//     required this.date,
//     required this.status,
//     required this.amount,
//     required this.statusColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   orderNumber,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//                 Text(
//                   amount,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(date, style: TextStyle(color: Colors.grey.shade600)),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 8,
//                     vertical: 4,
//                   ),
//                   decoration: BoxDecoration(
//                     color: statusColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text(
//                     status,
//                     style: TextStyle(
//                       color: statusColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             const Divider(),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.visibility),
//                   label: const Text("View Details"),
//                   style: TextButton.styleFrom(foregroundColor: Colors.blue),
//                 ),
//                 TextButton.icon(
//                   onPressed: () {},
//                   icon: const Icon(Icons.receipt),
//                   label: const Text("Invoice"),
//                   style: TextButton.styleFrom(
//                     foregroundColor: Colors.grey.shade700,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomersPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Customers",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.purple.shade700,
//         centerTitle: true,
//         elevation: 4,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           IconButton(icon: const Icon(Icons.search), onPressed: () {}),
//           IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
//         ],
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: const [
//           // Reduced to 3 customer items only
//           CustomerItem(
//             name: "John Doe",
//             email: "john.doe@example.com",
//             phone: "+1 (555) 123-4567",
//             totalOrders: 8,
//             totalSpent: "\$1,245.50",
//             avatarColor: Colors.blue,
//           ),
//           CustomerItem(
//             name: "Jane Smith",
//             email: "jane.smith@example.com",
//             phone: "+1 (555) 987-6543",
//             totalOrders: 12,
//             totalSpent: "\$2,890.75",
//             avatarColor: Colors.green,
//           ),
//           CustomerItem(
//             name: "Robert Johnson",
//             email: "robert.j@example.com",
//             phone: "+1 (555) 456-7890",
//             totalOrders: 5,
//             totalSpent: "\$750.25",
//             avatarColor: Colors.orange,
//           ),
//           // Removed the other customer items
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: Colors.purple.shade700,
//         child: const Icon(Icons.person_add),
//       ),
//     );
//   }
// }

// class CustomerItem extends StatelessWidget {
//   final String name;
//   final String email;
//   final String phone;
//   final int totalOrders;
//   final String totalSpent;
//   final Color avatarColor;

//   const CustomerItem({
//     Key? key,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.totalOrders,
//     required this.totalSpent,
//     required this.avatarColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 12),
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               radius: 30,
//               backgroundColor: avatarColor.withOpacity(0.2),
//               child: Text(
//                 name.substring(0, 1),
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: avatarColor,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     name,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     children: [
//                       const Icon(Icons.email, size: 16, color: Colors.grey),
//                       const SizedBox(width: 4),
//                       Text(
//                         email,
//                         style: TextStyle(color: Colors.grey.shade600),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     children: [
//                       const Icon(Icons.phone, size: 16, color: Colors.grey),
//                       const SizedBox(width: 4),
//                       Text(
//                         phone,
//                         style: TextStyle(color: Colors.grey.shade600),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   const Divider(),
//                   const SizedBox(height: 8),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             "Total Orders",
//                             style: TextStyle(color: Colors.grey, fontSize: 12),
//                           ),
//                           Text(
//                             totalOrders.toString(),
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           const Text(
//                             "Total Spent",
//                             style: TextStyle(color: Colors.grey, fontSize: 12),
//                           ),
//                           Text(
//                             totalSpent,
//                             style: const TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
