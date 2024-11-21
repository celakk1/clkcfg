boolean fix = false;
boolean fix2 = false;
boolean first = false;
float pitchx = 0;

void onPreUpdate() {
    if (modules.isEnabled("Scaffold")) {
        if (!first) {
            first = true;
            fix = true;
        }
    } else if (first) {
        first = false;
        fix2 = true;
    }
}

boolean onPacketSent(CPacket packet) {
    if (packet instanceof C03) {
        C03 newPacket = (C03) packet;
        Entity player = client.getPlayer();
        Vec3 position = player.getPosition();

        if (fix) {
            handleFix(newPacket, position);
            fix = false;
            return false;
        }

        if (modules.isEnabled("Scaffold") && !fix && !fix2) {
            pitchx = newPacket.yaw;  // Store current yaw for later use
        }

        if (fix2) {
            handleFix2(newPacket, position);
            fix2 = false;
            return false;
        }
    }
    return true;
}

void handleFix(C03 packet, Vec3 position) {
    float playerYaw = client.getPlayer().getYaw();
    float midYaw = (packet.yaw + playerYaw) / 2;
    client.sendPacketNoEvent(new C03(position, midYaw, packet.pitch, packet.ground));
}

void handleFix2(C03 packet, Vec3 position) {
    float playerYaw = client.getPlayer().getYaw();
    float midYaw = (pitchx + playerYaw) / 2;
    client.sendPacketNoEvent(new C03(position, midYaw, packet.pitch, packet.ground));
}
