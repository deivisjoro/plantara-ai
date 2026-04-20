// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

// FlutterFlow Custom Action
// Input parameters:
// - plantImage (FFUploadedFile) - uploaded image file
// - plantType (PlantType enum) - plant, mushroom, weed, disease, toxicity, tree
// - geminiApiKey (String) - Your Gemini API key
// - pexelsApiKey (String) - Your Pexels API key (get from https://www.pexels.com/api/)
// Output: PlantInformationStruct

Future<PlantInformationStruct?> getPlantInformation(
  FFUploadedFile plantImage,
  PlantType plantType,
  String geminiApiKey,
  String pexelsApiKey,
) async {
  try {
    // Convert FFUploadedFile to base64
    final bytes = plantImage.bytes;
    if (bytes == null || bytes.isEmpty) {
      return null;
    }

    final base64Image = base64Encode(bytes);

    // Convert enum to string
    final plantTypeString = plantType.name;

    // Determine image MIME type
    String mimeType = 'image/jpeg';
    if (plantImage.name != null) {
      if (plantImage.name!.toLowerCase().endsWith('.png')) {
        mimeType = 'image/png';
      } else if (plantImage.name!.toLowerCase().endsWith('.webp')) {
        mimeType = 'image/webp';
      } else if (plantImage.name!.toLowerCase().endsWith('.gif')) {
        mimeType = 'image/gif';
      }
    }

    // Call Gemini API to analyze plant
    final response = await http.post(
      Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$geminiApiKey'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'contents': [
          {
            'parts': [
              {
                'inline_data': {
                  'mime_type': mimeType,
                  'data': base64Image,
                }
              },
              {
                'text':
                    '''Analyze this $plantTypeString image and provide complete, detailed information in JSON format.

Identify the plant from the image and provide accurate information about it.

Return ONLY valid JSON with this exact structure (no markdown, no explanation, no code blocks):

{
  "name": "Common name of the plant you identified",
  "description": "Scientific name (e.g., Spathiphyllum wallisii)",
  "labels": ["Overview", "Requirements", "Culture", "FAQ", "Articles"],
  "overview": "General overview about this plant (2-3 sentences)",
  "temperature": {
    "min": 15,
    "max": 28
  },
  "hardiness": {
    "min": 5,
    "max": 10
  },
  "requires": [
    {
      "title": "Sunlight",
      "description": "Detailed sunlight requirements and recommendations (3-4 sentences)"
    },
    {
      "title": "Fertilizer",
      "description": "Detailed fertilizer needs and feeding schedule (3-4 sentences)"
    },
    {
      "title": "Propagating",
      "description": "Complete propagation methods and best practices (3-4 sentences)"
    },
    {
      "title": "Humidity",
      "description": "Humidity requirements and how to maintain them (3-4 sentences)"
    },
    {
      "title": "Soil",
      "description": "Soil type, pH, and composition requirements (3-4 sentences)"
    },
    {
      "title": "Pruning",
      "description": "Pruning guidelines, timing, and techniques (3-4 sentences)"
    },
    {
      "title": "Potting",
      "description": "Potting recommendations, container size, and repotting (3-4 sentences)"
    },
    {
      "title": "Diseases",
      "description": "Common diseases, symptoms, and prevention methods (3-4 sentences)"
    },
    {
      "title": "Temperature",
      "description": "Detailed temperature requirements and tolerance (3-4 sentences)"
    },
    {
      "title": "Container",
      "description": "Container growing tips and requirements (3-4 sentences)"
    },
    {
      "title": "Grow",
      "description": "General growing guidelines and care tips (3-4 sentences)"
    },
    {
      "title": "FunFact",
      "description": "Interesting and unique fact about this plant (2-3 sentences)"
    }
  ],
  "sunlight": "Brief sunlight summary in one line",
  "soil": "Brief soil requirements in one line",
  "location": "Growing zones and suitable locations in one line (e.g., USDA zones 9-11, indoor/outdoor)",
  "scientific": [
    {
      "title": "Order",
      "description": "Scientific order classification"
    },
    {
      "title": "Genus",
      "description": "Scientific genus name"
    },
    {
      "title": "Family",
      "description": "Scientific family classification"
    },
    {
      "title": "Class",
      "description": "Scientific class classification"
    },
    {
      "title": "Phylum",
      "description": "Scientific phylum classification"
    }
  ]
}

IMPORTANT REQUIREMENTS:
1. Identify the exact plant name from the image
2. All 12 "requires" items must have detailed, specific descriptions (3-4 sentences each)
3. All 5 "scientific" items must have accurate taxonomic information
4. Temperature should be in Celsius
5. Hardiness zones should be USDA standard (1-13)
6. Provide accurate, research-based information
7. Return ONLY the JSON object, no markdown formatting, no code blocks, no extra text
8. Do NOT include "images" field in the JSON response'''
              }
            ]
          }
        ],
        'generationConfig': {
          'temperature': 0.4,
          'topK': 32,
          'topP': 1,
          'maxOutputTokens': 4096,
        }
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Extract text from Gemini response
      final candidates = data['candidates'] as List<dynamic>;
      if (candidates.isEmpty) {
        print('Error: No candidates in response');
        return null;
      }

      final content = candidates[0]['content'];
      final parts = content['parts'] as List<dynamic>;
      if (parts.isEmpty) {
        print('Error: No parts in content');
        return null;
      }

      String textResponse = parts[0]['text'] as String;
      print(
          'Raw response: ${textResponse.substring(0, textResponse.length > 200 ? 200 : textResponse.length)}...');

      // Clean response if it contains markdown
      String cleanJson = textResponse.trim();
      if (cleanJson.startsWith('```json')) {
        cleanJson = cleanJson.substring(7);
      }
      if (cleanJson.startsWith('```')) {
        cleanJson = cleanJson.substring(3);
      }
      if (cleanJson.endsWith('```')) {
        cleanJson = cleanJson.substring(0, cleanJson.length - 3);
      }
      cleanJson = cleanJson.trim();

      // Parse JSON
      final plantData = jsonDecode(cleanJson) as Map<String, dynamic>;

      // Validate required fields
      if (!plantData.containsKey('name') ||
          !plantData.containsKey('requires') ||
          !plantData.containsKey('scientific')) {
        return null;
      }

      // Convert to PlantInformationStruct
      final plantName = plantData['name'] as String;

      // Fetch real images from Pexels API
      List<String> imageUrls = [];
      try {
        final searchQuery = plantName.toLowerCase();
        final pexelsResponse = await http.get(
          Uri.parse(
              'https://api.pexels.com/v1/search?query=$searchQuery&per_page=5'),
          headers: {
            'Authorization': pexelsApiKey,
          },
        );

        if (pexelsResponse.statusCode == 200) {
          final pexelsData = jsonDecode(pexelsResponse.body);
          final photos = pexelsData['photos'] as List<dynamic>;
          imageUrls =
              photos.map((photo) => photo['src']['large'] as String).toList();
        }
      } catch (e) {
        // If Pexels fails, use fallback placeholder images
        imageUrls = [
          'https://via.placeholder.com/800x600/4CAF50/FFFFFF?text=${Uri.encodeComponent(plantName)}',
        ];
      }

      // Ensure we have at least one image
      if (imageUrls.isEmpty) {
        imageUrls = [
          'https://via.placeholder.com/800x600/4CAF50/FFFFFF?text=${Uri.encodeComponent(plantName)}',
        ];
      }

      return PlantInformationStruct(
        name: plantName,
        description: plantData['description'] as String,
        labels: (plantData['labels'] as List<dynamic>)
            .map((e) => e as String)
            .toList(),
        overview: plantData['overview'] as String,
        temperature: TemperatureStruct(
          min: (plantData['temperature']['min'] as num).toInt(),
          max: (plantData['temperature']['max'] as num).toInt(),
        ),
        hardiness: TemperatureStruct(
          min: (plantData['hardiness']['min'] as num).toInt(),
          max: (plantData['hardiness']['max'] as num).toInt(),
        ),
        requires: (plantData['requires'] as List<dynamic>).map((item) {
          // Convert string to RequiresType enum
          final titleStr = item['title'] as String;
          RequiresType? titleEnum;

          switch (titleStr.toLowerCase()) {
            case 'sunlight':
              titleEnum = RequiresType.Sunlight;
              break;
            case 'fertilizer':
              titleEnum = RequiresType.Fertilizer;
              break;
            case 'propagating':
              titleEnum = RequiresType.Propagating;
              break;
            case 'humidity':
              titleEnum = RequiresType.Humidity;
              break;
            case 'soil':
              titleEnum = RequiresType.Soil;
              break;
            case 'pruning':
              titleEnum = RequiresType.Pruning;
              break;
            case 'potting':
              titleEnum = RequiresType.Potting;
              break;
            case 'diseases':
              titleEnum = RequiresType.Diseases;
              break;
            case 'temperature':
              titleEnum = RequiresType.Temperature;
              break;
            case 'container':
              titleEnum = RequiresType.Container;
              break;
            case 'grow':
              titleEnum = RequiresType.Grow;
              break;
            case 'funfact':
              titleEnum = RequiresType.FunFact;
              break;
          }

          return RequiresStruct(
            title: titleEnum,
            description: item['description'] as String,
          );
        }).toList(),
        sunlight: plantData['sunlight'] as String,
        soil: plantData['soil'] as String,
        location: plantData['location'] as String,
        images: imageUrls,
        scientific: (plantData['scientific'] as List<dynamic>)
            .map((item) => ScientificStruct(
                  title: item['title'] as String,
                  description: item['description'] as String,
                ))
            .toList(),
        created: DateTime.now(),
      );
    } else {
      return null;
    }
  } catch (e, stackTrace) {
    return null;
  }
}
