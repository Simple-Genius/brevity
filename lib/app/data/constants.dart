import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const categoryGradient =  LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF2CF3E7), Color(0xff3A49F9)]);

const categoryColor = Color(0xFFE5EAFC);

final supabase = Supabase.instance.client;