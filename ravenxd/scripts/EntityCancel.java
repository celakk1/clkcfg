void onLoad() {
}

void onEnable() {
    client.sendPacketNoEvent(new C0B("STOP_SPRINTING", 0));
}

boolean onPacketSent(CPacket packet) {
    if (packet instanceof C0B) {
        C0B jj = (C0B) packet;
        if (jj.action.equals("START_SPRINTING")) {
            return false;
        }
    }
    return true;
}
