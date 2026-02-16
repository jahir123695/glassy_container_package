import 'package:flutter/material.dart';
import 'package:liquid_glassy_container/liquid_glassy_container.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const DemoScreen(),
    );
  }
}

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const _GradientBackground(),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _TopBar(),
                  const SizedBox(height: 18),

                  const Text(
                    "Liquid Glass UI",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Beautiful glassmorphism container for Flutter",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.75),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // Small stats cards
                  Row(
                    children: const [
                      Expanded(
                        child: _GlassStatCard(
                          title: "Blur",
                          value: "20",
                          icon: Icons.blur_on_rounded,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _GlassStatCard(
                          title: "Radius",
                          value: "25",
                          icon: Icons.rounded_corner_rounded,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _GlassStatCard(
                          title: "Opacity",
                          value: "0.15",
                          icon: Icons.opacity_rounded,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // Main hero glass panel
                  Expanded(
                    child: Center(
                      child: LiquidGlassyContainer(
                        width: double.infinity,
                        blur: 22,
                        borderRadius: 28,
                        opacity: 0.14,
                        child: Padding(
                          padding: const EdgeInsets.all(22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _Pill(
                                    text: "v0.0.1",
                                    icon: Icons.verified_rounded,
                                  ),
                                  _Pill(
                                    text: "Example",
                                    icon: Icons.auto_awesome_rounded,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),

                              const Text(
                                "Make your UI\nfeel premium.",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  height: 1.08,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Use LiquidGlassyContainer to create modern glass cards, panels and pills with blur + border + transparency.",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.75),
                                  height: 1.35,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              const Spacer(),

                              Row(
                                children: [
                                  Expanded(
                                    child: _GlassButton(
                                      text: "Copy Snippet",
                                      icon: Icons.content_copy_rounded,
                                      onTap: () {
                                        // keep demo simple — no clipboard needed
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: _GlassButton(
                                      text: "Showcase",
                                      icon: Icons.star_rounded,
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      "Crafted by:  Mohamad Jahir",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.55),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GradientBackground extends StatelessWidget {
  const _GradientBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0B1020), Color(0xFF122B5C), Color(0xFF0B1020)],
        ),
      ),
      child: Stack(
        children: const [
          _GlowBlob(alignment: Alignment(-1.0, -0.8), size: 260),
          _GlowBlob(alignment: Alignment(1.0, -0.2), size: 220),
          _GlowBlob(alignment: Alignment(0.2, 1.0), size: 280),
        ],
      ),
    );
  }
}

class _GlowBlob extends StatelessWidget {
  final Alignment alignment;
  final double size;

  const _GlowBlob({required this.alignment, required this.size});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.white.withOpacity(0.12), Colors.transparent],
          ),
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white12,
          child: Icon(Icons.water_drop_rounded, color: Colors.white),
        ),
        const SizedBox(width: 12),
        const Text(
          "Liquid Glassy",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        Icon(Icons.wifi_rounded, color: Colors.white.withOpacity(0.7)),
        const SizedBox(width: 10),
        Icon(Icons.battery_full_rounded, color: Colors.white.withOpacity(0.7)),
      ],
    );
  }
}

class _GlassStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _GlassStatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return LiquidGlassyContainer(
      blur: 18,
      borderRadius: 18,
      opacity: 0.12,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withOpacity(0.10),
                border: Border.all(color: Colors.white.withOpacity(0.18)),
              ),
              child: Icon(icon, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.72),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  final String text;
  final IconData icon;

  const _Pill({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return LiquidGlassyContainer(
      blur: 18,
      borderRadius: 999,
      opacity: 0.10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _GlassButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LiquidGlassyContainer(
        blur: 20,
        borderRadius: 18,
        opacity: 0.13,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 18),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
