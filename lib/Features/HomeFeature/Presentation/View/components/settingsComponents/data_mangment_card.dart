import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/clear_cache_dialog.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/components/settingsComponents/clear_data_dialog.dart';
import 'package:bitpulse/Features/HomeFeature/Presentation/View/cubit/home_cubit_cubit.dart';
import 'package:bitpulse/core/l10n/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataMangmentCard extends StatelessWidget {
  const DataMangmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.storage, color: Colors.orange),
            title:  Text(AppLocalizations.of(context).clear_cache),
            subtitle:  Text(AppLocalizations.of(context).Clear_app_cache_data),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext dialogContext) {
                return ClearCacheDialog();
              },
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.delete_forever, color: Colors.red),
            title:  Text(AppLocalizations.of(context).Clear_All_Data),
            subtitle:  Text(AppLocalizations.of(context).Reset_app_to_default),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => showDialog(
              context: context,
              barrierDismissible: false, // Prevent dismissing during operation
              builder: (dialogContext) => ClearDataDialog(
                onClearAll: () async {
                  await context.read<HomeCubit>().clearAllData(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
