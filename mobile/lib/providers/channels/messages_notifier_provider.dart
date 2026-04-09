import 'package:mobile/models/channels/message.dart';
import 'package:mobile/repositories/channel_repo/channels_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messages_notifier_provider.g.dart';

@riverpod
class MessagesNotifier extends _$MessagesNotifier {
  @override
  Stream<List<Message>> build(String channelId) async* {
    final repo = await ref.watch(channelsRepositoryProvider.future);

    yield* repo.fetchMessages(channelId);
  }

  Future<void> refreshMessages(String channelId) async {
    ref.invalidateSelf();
  }
}
