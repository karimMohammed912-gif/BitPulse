import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildStatRow extends StatelessWidget {
  const BuildStatRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final bool shouldWrap = label.length > 15 || value.length > 20;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: shouldWrap
          ? _buildColumnLayout(context)
          : _buildRowLayout(context),
    );
  }

  Widget _buildRowLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            overflow: TextOverflow.fade,
            style: const TextStyle(fontSize: 14),
          ),
        ),
        Expanded(
          flex: 3,
          child: LinkableText(text: value),
        ),
      ],
    );
  }

  Widget _buildColumnLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: double.infinity,
          child: LinkableText(text: value, alignEnd: true),
        ),
      ],
    );
  }
}

class LinkableText extends StatelessWidget {
  const LinkableText({
    super.key,
    required this.text,
    this.alignEnd = false,
  });

  final String text;
  final bool alignEnd;

  bool get _looksLikeUrl {
    final String value = text.trim();
    if (value.isEmpty) return false;
    final String lower = value.toLowerCase();
    if (lower == 'n/a' || lower == 'null') return false;

    // Reject numeric-like values (e.g., "12.34", "45%", "1,234.56")
    final String numericCandidate = value.replaceAll(',', '').replaceAll('%', '');
    if (double.tryParse(numericCandidate) != null) return false;

    if (lower.startsWith('http://') || lower.startsWith('https://')) return true;

    // Require at least one letter and an alphabetic TLD (>= 2)
    final bool hasLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
    if (!hasLetter) return false;
    final RegExp domainPattern = RegExp(
      r'^(www\.)?([a-z0-9-]+\.)+[a-z]{2,}([/\?#].*)?$',
      caseSensitive: false,
    );
    return domainPattern.hasMatch(value);
  }

  String _normalizeUrl(String value) {
    final String trimmed = value.trim();
    if (trimmed.isEmpty) return trimmed;
    final String lower = trimmed.toLowerCase();
    if (lower == 'n/a' || lower == 'null') return '';
    if (lower.startsWith('http://') || lower.startsWith('https://')) return trimmed;
    return 'https://$trimmed';
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle baseStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    );

    if (!_looksLikeUrl) {
      return Text(
        text,
        maxLines: 4,
        overflow: TextOverflow.fade,
        textAlign: alignEnd ? TextAlign.end : TextAlign.start,
        style: baseStyle,
      );
    }

    return Align(
      alignment: alignEnd ? Alignment.centerRight : Alignment.centerLeft,
      child: InkWell(
        onTap: () async {
          final String normalized = _normalizeUrl(text);
          if (normalized.isEmpty) return;
          final Uri uri = Uri.parse(normalized);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: Text(
          _normalizeUrl(text),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: alignEnd ? TextAlign.end : TextAlign.start,
          style: baseStyle.copyWith(
            color: Theme.of(context).colorScheme.primary,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
