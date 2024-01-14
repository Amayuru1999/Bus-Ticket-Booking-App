import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BusBookingSelectPage extends StatefulWidget {
  const BusBookingSelectPage({super.key});

  @override
  State<BusBookingSelectPage> createState() => _BusBookingSelectPageState();
}

class _BusBookingSelectPageState extends State<BusBookingSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Select Seat"),
        titleTextStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pushNamed(context, "/detail");
          },
          color: Colors.red,
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const Text(
                  "Standard",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const Text(
                  "Premium",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.clear,
                    ),
                  ),
                ),
                const Text(
                  "Taken",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(42.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)),
                            child: const Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 16),
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)),
                            child: const Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)),
                            child: const Center(
                              child: Text(
                                "4",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Center(
                              child: Text(
                                "5",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.orange,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)),
                            child: const Center(
                              child: Text(
                                "6",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(right: 16),
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: Colors.grey[400]!,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.clear,
                              ),
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.orange,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)),
                            child: const Center(
                              child: Text(
                                "8",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 96 + 12,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                "Table",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 96 + 12,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                "Table",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                                width: 3,
                              ),
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Center(
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const _GeneralSeatComponent(
                            borderColor: Colors.orange,
                            title: "10",
                          ),
                          const Spacer(),
                          Container(
                            height: 48,
                            width: 48,
                            margin: const EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.orange,
                                width: 3,
                              ),
                              // color: Colors.orange,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Center(
                              child: Text(
                                "11",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          const _TakenSeatComponent(),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        children: [
                          _GeneralSeatComponent(
                            borderColor: Colors.red,
                            title: "13",
                            marginRight: 16,
                          ),
                          _GeneralSeatComponent(
                            borderColor: Colors.red,
                            title: "14",
                            marginRight: 0,
                          ),
                          Spacer(),
                          _TakenSeatComponent(
                            marginRight: 16,
                          ),
                          _TakenSeatComponent(),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        children: [
                          _GeneralSeatComponent(
                            borderColor: Colors.red,
                            title: "17",
                            marginRight: 16,
                          ),
                          _TakenSeatComponent(),
                          Spacer(),
                          _GeneralSeatComponent(
                            borderColor: Colors.red,
                            title: "19",
                            marginRight: 16,
                          ),
                          _GeneralSeatComponent(
                            borderColor: Colors.red,
                            title: "20",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        children: [
                          _TakenSeatComponent(
                            marginRight: 16,
                          ),
                          _GeneralSeatComponent(
                            borderColor: Colors.red,
                            title: "22",
                            marginRight: 0,
                          ),
                          Spacer(),
                          _TakenSeatComponent(
                            marginRight: 16,
                          ),
                          _TakenSeatComponent(
                            marginRight: 0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        children: [
                          _TakenSeatComponent(
                            marginRight: 16,
                          ),
                          _TakenSeatComponent(
                            marginRight: 0,
                          ),
                          Spacer(),
                          _GeneralSeatComponent(
                            borderColor: Colors.red,
                            title: "27",
                            marginRight: 16,
                          ),
                          _GeneralSeatComponent(
                            borderColor: Colors.red,
                            title: "28",
                            marginRight: 0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Row(
                        children: [
                          _GeneralSeatComponent(
                            borderColor: Colors.red,
                            title: "29",
                            marginRight: 16,
                          ),
                          _GeneralSeatComponent(
                            borderColor: Colors.red,
                            title: "30",
                            marginRight: 0,
                          ),
                          Spacer(),
                          _GeneralSeatComponent(
                            borderColor: Colors.red,
                            title: "31",
                            marginRight: 16,
                          ),
                          _TakenSeatComponent(
                            marginRight: 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: BottomAppBar(
          elevation: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Row(
              children: [
                const Text(
                  "Seat: 1/1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: const Center(
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TakenSeatComponent extends StatelessWidget {
  const _TakenSeatComponent({
    this.marginRight = 0.0,
  });
  final double? marginRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginRight ?? 0),
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        color: Colors.grey[400]!,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Center(
        child: Icon(
          Icons.clear,
        ),
      ),
    );
  }
}

class _GeneralSeatComponent extends StatelessWidget {
  final String? title;
  final Color borderColor;
  final double? marginRight;

  const _GeneralSeatComponent({
    this.title,
    this.borderColor = Colors.red,
    this.marginRight = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      margin: EdgeInsets.only(
        right: marginRight ?? 0,
      ),
      child: Center(
        child: Text(
          "$title",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
