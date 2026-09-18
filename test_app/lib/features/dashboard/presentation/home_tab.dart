import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
 
import 'package:test_app/app/routes.dart';
import 'package:test_app/core/data/mock_data.dart';
import 'package:test_app/core/widgets/section_header.dart';
import 'package:test_app/features/dashboard/widgets/balance_card.dart';
import 'package:test_app/features/dashboard/widgets/quick_actions.dart';
import 'package:test_app/features/transactions/widgets/transaction_tile.dart';
 
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
 
  @override
  Widget build(BuildContext context) {
    final primary = MockData.accounts.first;
    final recent = MockData.transactionFor(primary.id).take(5).toList();
 
    // The whole page is one ListView, so nothing inside needs its own scroll.
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        BalanceCard(
          account: primary,
          onTap: () => context.push(AppRoutes.accounts(primary.id)),
        ),
        const SizedBox(height: 24),
        const SectionHeader(title: 'Quick actions'),
        const SizedBox(height: 8),
        const QuickActions(),
        const SizedBox(height: 16),
        SectionHeader(
          title: 'Recent transactions',
          actionLabel: 'View all',
          onAction: () => context.push(AppRoutes.statement(primary.id)),
        ),
        Card(
          child: Column(
            children: [
              for (final txn in recent) TransactionTile(txn: txn),
            ],
          ),
        ),
      ],
    );
  }
}
